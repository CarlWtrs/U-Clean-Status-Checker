// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 2.15
import QtQuick.Layouts 1.15
import HelperWidgets 2.0
import StudioTheme 1.0 as StudioTheme

Column {
    width: parent.width

    Section {
        caption: qsTr("Principled Material")
        width: parent.width

        SectionLayout {
            PropertyLabel {
                text: qsTr("Alpha Mode")
                tooltip: qsTr("Sets the mode for how the alpha channel of material color is used.")
            }

            SecondColumnLayout {
                ComboBox {
                    scope: "PrincipledMaterial"
                    model: ["Default", "Mask", "Blend", "Opaque"]
                    backendValue: backendValues.alphaMode
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Alpha Cutoff")
                tooltip: qsTr("Sets the cutoff value when using the Mask alphaMode.")
            }

            SecondColumnLayout {
                SpinBox {
                    minimumValue: 0
                    maximumValue: 1
                    decimals: 2
                    stepSize: 0.1
                    backendValue: backendValues.alphaCutoff
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Blend Mode")
                tooltip: qsTr("Sets how the colors of the model rendered blend with those behind it.")
            }

            SecondColumnLayout {
                ComboBox {
                    scope: "PrincipledMaterial"
                    model: ["SourceOver", "Screen", "Multiply"]
                    backendValue: backendValues.blendMode
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Lighting")
                tooltip: qsTr("Sets which lighting method is used when generating this material.")
            }

            SecondColumnLayout {
                ComboBox {
                    scope: "PrincipledMaterial"
                    model: ["NoLighting", "FragmentLighting"]
                    backendValue: backendValues.lighting
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Point Size")
                tooltip: qsTr("Sets the size of the points rendered, when the geometry is using a primitive type of points.")
            }

            SecondColumnLayout {
                SpinBox {
                    minimumValue: -9999999
                    maximumValue: 9999999
                    decimals: 2
                    backendValue: backendValues.pointSize
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Line Width")
                tooltip: qsTr("Sets the width of the lines rendered, when the geometry is using a primitive type of lines or line strips.")
            }
            SecondColumnLayout {
                SpinBox {
                    minimumValue: -9999999
                    maximumValue: 9999999
                    decimals: 2
                    backendValue: backendValues.lineWidth
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Index of Refraction")
                tooltip: qsTr("Sets the index of refraction of the material.")
            }

            SecondColumnLayout {
                SpinBox {
                    minimumValue: 1
                    maximumValue: 3
                    decimals: 2
                    stepSize: 0.1
                    backendValue: backendValues.indexOfRefraction
                    implicitWidth: StudioTheme.Values.twoControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }

    Section {
        caption: qsTr("Base Color")
        width: parent.width

        SectionLayout {
            PropertyLabel {
                text: qsTr("Color")
            }

            ColorEditor {
                backendValue: backendValues.baseColor
                supportGradient: false
            }

            PropertyLabel {
                text: qsTr("Map")
                tooltip: qsTr("Sets a texture used to set the base color of the material.")
            }

            SecondColumnLayout {
                IdComboBox {
                    typeFilter: "QtQuick3D.Texture"
                    backendValue: backendValues.baseColorMap
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                    + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }

    Section {
        caption: qsTr("Metalness")
        width: parent.width

        SectionLayout {
            PropertyLabel {
                text: qsTr("Amount")
                tooltip: qsTr("Sets the metalness of the the material.")
            }

            SecondColumnLayout {
                SpinBox {
                    minimumValue: 0
                    maximumValue: 1
                    decimals: 2
                    stepSize: 0.1
                    backendValue: backendValues.metalness
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Map")
                tooltip: qsTr("Sets a texture to be used to set the metalness amount for the different parts of the material.")
            }

            SecondColumnLayout {
                IdComboBox {
                    typeFilter: "QtQuick3D.Texture"
                    backendValue: backendValues.metalnessMap
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Channel")
                tooltip: qsTr("Sets the texture channel used to read the metalness value from metalnessMap.")
            }

            SecondColumnLayout {
                ComboBox {
                    scope: "Material"
                    model: ["R", "G", "B", "A"]
                    backendValue: backendValues.metalnessChannel
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }

    Section {
        caption: qsTr("Attenuation")
        width: parent.width

        SectionLayout {
            PropertyLabel {
                text: qsTr("Color")
                tooltip: qsTr("Sets the color that white lights turn into due to absorption when reaching the attenuation distance.")
            }

            ColorEditor {
                backendValue: backendValues.attenuationColor
                supportGradient: false
            }

            PropertyLabel {
                text: qsTr("Distance")
                tooltip: qsTr("Sets the average distance in world space that light travels in the medium before interacting with a particle.")
            }

            SecondColumnLayout {
                SpinBox {
                    minimumValue: 0
                    maximumValue: Infinity
                    decimals: 2
                    backendValue: backendValues.attenuationDistance
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }

    Section {
        caption: qsTr("Normal")
        width: parent.width

        SectionLayout {
            PropertyLabel {
                text: qsTr("Map")
                tooltip: qsTr("Sets an RGB image used to simulate fine geometry displacement across the surface of the material.")
            }

            SecondColumnLayout {
                IdComboBox {
                    typeFilter: "QtQuick3D.Texture"
                    backendValue: backendValues.normalMap
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Strength")
                tooltip: qsTr("Sets the amount of simulated displacement for the normalMap.")
            }

            SecondColumnLayout {
                SpinBox {
                    minimumValue: 0
                    maximumValue: 1
                    decimals: 2
                    stepSize: 0.1
                    backendValue: backendValues.normalStrength
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }

    Section {
        caption: qsTr("Occlusion")
        width: parent.width

        SectionLayout {
            PropertyLabel {
                text: qsTr("Amount")
                tooltip: qsTr("Sets the factor used to modify the values from the occlusionMap texture.")
            }

            SecondColumnLayout {
                SpinBox {
                    minimumValue: 0
                    maximumValue: 1
                    decimals: 2
                    stepSize: 0.1
                    backendValue: backendValues.occlusionAmount
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Map")
                tooltip: qsTr("Sets a texture used to determine how much indirect light the different areas of the material should receive.")
            }

            SecondColumnLayout {
                IdComboBox {
                    typeFilter: "QtQuick3D.Texture"
                    backendValue: backendValues.occlusionMap
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Channel")
                tooltip: qsTr("Sets the texture channel used to read the occlusion value from occlusionMap.")
            }

            SecondColumnLayout {
                ComboBox {
                    scope: "Material"
                    model: ["R", "G", "B", "A"]
                    backendValue: backendValues.occlusionChannel
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }

    Section {
        caption: qsTr("Opacity")
        width: parent.width

        SectionLayout {
            PropertyLabel {
                text: qsTr("Amount")
                tooltip: qsTr("Sets the opacity of just this material, separate from the model.")
            }

            SecondColumnLayout {
                SpinBox {
                    minimumValue: 0
                    maximumValue: 1
                    decimals: 2
                    stepSize: 0.1
                    backendValue: backendValues.opacity
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Map")
                tooltip: qsTr("Sets a texture used to control the opacity differently for different parts of the material.")
            }

            SecondColumnLayout {
                IdComboBox {
                    typeFilter: "QtQuick3D.Texture"
                    backendValue: backendValues.opacityMap
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Channel")
                tooltip: qsTr("Sets the texture channel used to read the opacity value from opacityMap.")
            }

            SecondColumnLayout {
                ComboBox {
                    scope: "Material"
                    model: ["R", "G", "B", "A"]
                    backendValue: backendValues.opacityChannel
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }

    Section {
        caption: qsTr("Roughness")
        width: parent.width

        SectionLayout {
            PropertyLabel {
                text: qsTr("Roughness")
                tooltip: qsTr("Sets the size of the specular highlight generated from lights, and the clarity of reflections in general.")
            }

            SecondColumnLayout {
                SpinBox {
                    minimumValue: 0
                    maximumValue: 1
                    decimals: 2
                    stepSize: 0.1
                    backendValue: backendValues.roughness
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Map")
                tooltip: qsTr("Sets a texture to control the specular roughness of the material.")
            }

            SecondColumnLayout {
                IdComboBox {
                    typeFilter: "QtQuick3D.Texture"
                    backendValue: backendValues.roughnessMap
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Channel")
                tooltip: qsTr("Sets the texture channel used to read the roughness value from roughnessMap.")
            }

            SecondColumnLayout {
                ComboBox {
                    scope: "Material"
                    model: ["R", "G", "B", "A"]
                    backendValue: backendValues.roughnessChannel
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }

    Section {
        caption: qsTr("Height")
        width: parent.width

        SectionLayout {
            PropertyLabel {
                text: qsTr("Map")
                tooltip: qsTr("Sets a texture used to determine the height the texture will be displaced when rendered through the use of Parallax Mapping.")
            }

            SecondColumnLayout {
                IdComboBox {
                    typeFilter: "QtQuick3D.Texture"
                    backendValue: backendValues.heightMap
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Channel")
                tooltip: qsTr("Sets the texture channel used to read the height value from heightMap.")
            }

            SecondColumnLayout {
                ComboBox {
                    scope: "Material"
                    model: ["R", "G", "B", "A"]
                    backendValue: backendValues.heightChannel
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Amount")
                tooltip: qsTr("Sets the factor used to modify the values from the heightMap texture.")
            }

            SecondColumnLayout {
                SpinBox {
                    minimumValue: 0
                    maximumValue: 1
                    decimals: 2
                    stepSize: 0.1
                    backendValue: backendValues.heightAmount
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Min Map Samples")
                tooltip: qsTr("Sets the minimum number of samples used for performing Parallex Occlusion Mapping using the heightMap.")
            }

            SecondColumnLayout {
                SpinBox {
                    minimumValue: 0
                    maximumValue: 9999999
                    decimals: 0
                    backendValue: backendValues.minHeightMapSamples
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Max Map Samples")
                tooltip: qsTr("Sets the maximum number of samples used for performing Parallex Occlusion Mapping using the heightMap.")
            }

            SecondColumnLayout {
                SpinBox {
                    minimumValue: 0
                    maximumValue: 9999999
                    decimals: 0
                    backendValue: backendValues.maxHeightMapSamples
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }

    Section {
        caption: qsTr("Clearcoat")
        width: parent.width

        SectionLayout {

            PropertyLabel {
                text: qsTr("Amount")
                tooltip: qsTr("Sets the intensity of the clearcoat layer.")
            }

            SecondColumnLayout {
                SpinBox {
                    minimumValue: 0
                    maximumValue: 1
                    decimals: 2
                    stepSize: 0.1
                    backendValue: backendValues.clearcoatAmount
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Map")
                tooltip: qsTr("Sets a texture used to determine the intensity of the clearcoat layer.")
            }

            SecondColumnLayout {
                IdComboBox {
                    typeFilter: "QtQuick3D.Texture"
                    backendValue: backendValues.clearcoatMap
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Channel")
                tooltip: qsTr("Sets the texture channel used to read the intensity from clearcoatMap.")
            }

            SecondColumnLayout {
                ComboBox {
                    scope: "Material"
                    model: ["R", "G", "B", "A"]
                    backendValue: backendValues.clearcoatChannel
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Roughness Amount")
                tooltip: qsTr("Sets the roughness of the clearcoat layer.")
            }

            SecondColumnLayout {
                SpinBox {
                    minimumValue: 0
                    maximumValue: 1
                    decimals: 2
                    stepSize: 0.1
                    backendValue: backendValues.clearcoatRoughnessAmount
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Roughness Map")
                tooltip: qsTr("Sets a texture used to determine the roughness of the clearcoat layer.")
            }

            SecondColumnLayout {
                IdComboBox {
                    typeFilter: "QtQuick3D.Texture"
                    backendValue: backendValues.clearcoatRoughnessMap
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Roughness Channel")
                tooltip: qsTr("Sets the texture channel used to read the roughness from clearcoatRoughnessMap.")
            }

            SecondColumnLayout {
                ComboBox {
                    scope: "Material"
                    model: ["R", "G", "B", "A"]
                    backendValue: backendValues.clearcoatRoughnessChannel
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Normal Map")
                tooltip: qsTr("Sets a texture used as a normalMap for the clearcoat layer.")
            }

            SecondColumnLayout {
                IdComboBox {
                    typeFilter: "QtQuick3D.Texture"
                    backendValue: backendValues.clearcoatNormalMap
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }

    Section {
        caption: qsTr("Transmission")
        width: parent.width

        SectionLayout {

            PropertyLabel {
                text: qsTr("Factor")
                tooltip: qsTr("Sets the base percentage of light that is transmitted through the surface.")
            }

            SecondColumnLayout {
                SpinBox {
                    minimumValue: 0
                    maximumValue: 1
                    decimals: 2
                    stepSize: 0.1
                    backendValue: backendValues.transmissionFactor
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Map")
                tooltip: qsTr("Sets a texture that contains the transmission percentage of a the surface.")
            }

            SecondColumnLayout {
                IdComboBox {
                    typeFilter: "QtQuick3D.Texture"
                    backendValue: backendValues.transmissionMap
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Channel")
                tooltip: qsTr("Sets the texture channel used to read the transmission percentage from transmissionMap.")
            }

            SecondColumnLayout {
                ComboBox {
                    scope: "Material"
                    model: ["R", "G", "B", "A"]
                    backendValue: backendValues.transmissionChannel
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }

    Section {
        caption: qsTr("Specular")
        width: parent.width

        SectionLayout {
            PropertyLabel {
                text: qsTr("Amount")
                tooltip: qsTr("Sets the strength of specularity (highlights and reflections).")
            }

            SecondColumnLayout {
                SpinBox {
                    minimumValue: 0
                    maximumValue: 1
                    decimals: 2
                    stepSize: 0.1
                    backendValue: backendValues.specularAmount
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Map")
                tooltip: qsTr("Sets a RGB Texture to modulate the amount and the color of specularity across the surface of the material.")
            }

            SecondColumnLayout {
                IdComboBox {
                    typeFilter: "QtQuick3D.Texture"
                    backendValue: backendValues.specularMap
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Reflection Map")
                tooltip: qsTr("Sets a texture used for specular highlights on the material.")
            }

            SecondColumnLayout {
                IdComboBox {
                    typeFilter: "QtQuick3D.Texture"
                    backendValue: backendValues.specularReflectionMap
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Tint")
                tooltip: qsTr("Sets how much of the base color contributes to the specular reflections.")
            }

            SecondColumnLayout {
                SpinBox {
                    minimumValue: 0
                    maximumValue: 1
                    decimals: 2
                    stepSize: 0.1
                    backendValue: backendValues.specularTint
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }

    Section {
        caption: qsTr("Thickness")
        width: parent.width

        SectionLayout {

            PropertyLabel {
                text: qsTr("Factor")
                tooltip: qsTr("Sets the thickness of the volume beneath the surface in model coordinate space.")
            }

            SecondColumnLayout {
                SpinBox {
                    minimumValue: 0
                    maximumValue: Infinity
                    decimals: 2
                    backendValue: backendValues.thicknessFactor
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Map")
                tooltip: qsTr("Sets a texture that contains the thickness of a the material volume.")
            }

            SecondColumnLayout {
                IdComboBox {
                    typeFilter: "QtQuick3D.Texture"
                    backendValue: backendValues.thicknessMap
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Channel")
                tooltip: qsTr("Sets the texture channel used to read the thickness amount from thicknessMap.")
            }

            SecondColumnLayout {
                ComboBox {
                    scope: "Material"
                    model: ["R", "G", "B", "A"]
                    backendValue: backendValues.thicknessChannel
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                   + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }
        }
    }

    Section {
        caption: qsTr("Emissive Color")
        width: parent.width

        SectionLayout {
            PropertyLabel {
                text: qsTr("Map")
                tooltip: qsTr("Sets a texture to be used to set the emissive factor for different parts of the material.")
            }

            SecondColumnLayout {
                IdComboBox {
                    typeFilter: "QtQuick3D.Texture"
                    backendValue: backendValues.emissiveMap
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                    + StudioTheme.Values.actionIndicatorWidth
                }

                ExpandingSpacer {}
            }

            PropertyLabel {
                text: qsTr("Factor")
                tooltip: qsTr("Sets the color of self-illumination for this material.")
            }

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                    + StudioTheme.Values.actionIndicatorWidth
                    minimumValue: 0
                    maximumValue: 1
                    decimals: 2
                    stepSize: 0.01
                    backendValue: backendValues.emissiveFactor_x
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                ControlLabel {
                    text: "X"
                    color: StudioTheme.Values.theme3DAxisXColor
                }

                ExpandingSpacer {}
            }

            PropertyLabel {}

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                    + StudioTheme.Values.actionIndicatorWidth
                    minimumValue: 0
                    maximumValue: 1
                    decimals: 2
                    stepSize: 0.01
                    backendValue: backendValues.emissiveFactor_y
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                ControlLabel {
                    text: "Y"
                    color: StudioTheme.Values.theme3DAxisYColor
                }

                ExpandingSpacer {}
            }

            PropertyLabel {}

            SecondColumnLayout {
                SpinBox {
                    implicitWidth: StudioTheme.Values.singleControlColumnWidth
                                    + StudioTheme.Values.actionIndicatorWidth
                    minimumValue: 0
                    maximumValue: 1
                    decimals: 2
                    stepSize: 0.01
                    backendValue: backendValues.emissiveFactor_z
                }

                Spacer { implicitWidth: StudioTheme.Values.controlLabelGap }

                ControlLabel {
                    text: "Z"
                    color: StudioTheme.Values.theme3DAxisZColor
                }

                ExpandingSpacer {}
            }
        }
    }
}