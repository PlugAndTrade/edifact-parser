defmodule EdifactParserTest do
  use ExUnit.Case
  doctest EdifactParser

  @ordrsp """
  UNA:+.? '
  UNB+UNOC:1+tiJE1VCm1dJ4j5Tv:92+hsae4K0Nl0ZsAmCU:14+170829:1425+1+1'
  UNH+SGU8Gtp6jW+ORDRSP:D:96A:UN:EAN005'
  BGM+231+Vu1BWIIafc+28'
  DTM+137:20170829:102'
  DTM+2:201708021117:203'
  RFF+CR'
  DTM+171:20170802:102'
  RFF+ON:JJTWZ'
  DTM+171:20170802:102'
  RFF+VN:8MeM5c9Eud'
  DTM+171:20170802:102'
  NAD+BY+mgv7uM8hH7hM9::9++Buyer Buyerson+Buyer Street 1+Buyersburg++11111+SE'
  NAD+DP+WtVsJR9O8ReDL::9++Delivery Partyson+Delivery Street 2+Partysburg++22222+SE'
  NAD+IV+UOHipyUD9amRR::9++Invoicee Invoison+Invoice Street 3+Invoiceburge++33333+SE'
  NAD+SU+5DnEnBDKl3IHi::9++Supplier Supplierson+Suppliers Street 4+Suppliersburg++44444+SE'
  RFF+VA:R58lfbMP8r9b'
  CTA+IC+:Employee Employeeson'
  COM+?+4640123456:FX'
  COM+?+4640654321:TE'
  CUX+2:SEK:9'
  PAT+1+6:ZZZ::30 dagar'
  TDT+20++003'
  TOD+3++FCA'
  LIN+1+5+0123456789012:EN'
  PIA+1+V12345678:SA::91+0123456789012:IN::92'
  IMD+F++:::Product one'
  QTY+21:1:PCE'
  QTY+113:1:PCE'
  QTY+47:1:PCE'
  DTM+2:20171002:102'
  DTM+64:20171002:102'
  DTM+69:20171002:102'
  DTM+85:20171002:102'
  MOA+203:306.00'
  PRI+AAA:306.00::::STK'
  PRI+AAB:340.00::::STK'
  RFF+ON:JJTWZ:5'
  RFF+PL:V7'
  RFF+VN:8MeM5c9Eud:1'
  LIN+2+5+0123456789012:EN'
  PIA+1+V12345678:SA::91+0123456789012:IN::92'
  IMD+F++:::Product two'
  QTY+21:1:PCE'
  QTY+113:1:PCE'
  QTY+47:1:PCE'
  DTM+2:20171002:102'
  DTM+64:20171002:102'
  DTM+69:20171002:102'
  DTM+85:20171002:102'
  MOA+203:614.70'
  PRI+AAA:614.70::::STK'
  PRI+AAB:683.00::::STK'
  RFF+ON:JJTWZ:10'
  RFF+PL:V7'
  RFF+VN:8MeM5c9Eud:2'
  LIN+3+5+0123456789012:EN'
  PIA+1+V12345678:SA::91+0123456789012:IN::92'
  IMD+F++:::Product three'
  QTY+21:1:PCE'
  QTY+113:1:PCE'
  QTY+47:1:PCE'
  DTM+2:20171002:102'
  DTM+64:20171002:102'
  DTM+69:20171002:102'
  DTM+85:20171002:102'
  MOA+203:614.70'
  PRI+AAA:614.70::::STK'
  PRI+AAB:683.00::::STK'
  RFF+ON:JJTWZ:15'
  RFF+PL:V7'
  RFF+VN:8MeM5c9Eud:3'
  LIN+4+5+0123456789012:EN'
  PIA+1+V12345678:SA::91+0123456789012:IN::92'
  IMD+F++:::Product four'
  QTY+21:1:PCE'
  QTY+113:1:PCE'
  QTY+47:1:PCE'
  DTM+2:20171002:102'
  DTM+64:20171002:102'
  DTM+69:20171002:102'
  DTM+85:20171002:102'
  MOA+203:882.90'
  PRI+AAA:882.90::::STK'
  PRI+AAB:981.00::::STK'
  RFF+ON:JJTWZ:20'
  RFF+PL:V7'
  RFF+VN:8MeM5c9Eud:4'
  LIN+5+5+0123456789012:EN'
  PIA+1+V12345678:SA::91+0123456789012:IN::92'
  IMD+F++:::Product five'
  QTY+21:2:PCE'
  QTY+113:2:PCE'
  QTY+47:2:PCE'
  DTM+2:20171002:102'
  DTM+64:20171002:102'
  DTM+69:20171002:102'
  DTM+85:20171002:102'
  MOA+203:941.40'
  PRI+AAA:470.70::::STK'
  PRI+AAB:523.00::::STK'
  RFF+ON:JJTWZ:25'
  RFF+PL:V7'
  RFF+VN:8MeM5c9Eud:5'
  LIN+6+5+0123456789012:EN'
  PIA+1+V12345678:SA::91+0123456789012:IN::92'
  IMD+F++:::Product six'
  QTY+21:1:PCE'
  QTY+113:1:PCE'
  QTY+47:1:PCE'
  DTM+2:20171002:102'
  DTM+64:20171002:102'
  DTM+69:20171002:102'
  DTM+85:20171002:102'
  MOA+203:720.90'
  PRI+AAA:720.90::::STK'
  PRI+AAB:801.00::::STK'
  RFF+ON:JJTWZ:30'
  RFF+PL:V7'
  RFF+VN:8MeM5c9Eud:6'
  LIN+7+5+0123456789012:EN'
  PIA+1+V12345678:SA::91+0123456789012:IN::92'
  IMD+F++:::Product seven'
  QTY+21:2:PCE'
  QTY+113:2:PCE'
  QTY+47:2:PCE'
  DTM+2:20171002:102'
  DTM+64:20171002:102'
  DTM+69:20171002:102'
  DTM+85:20171002:102'
  MOA+203:349.20'
  PRI+AAA:174.60::::STK'
  PRI+AAB:194.00::::STK'
  RFF+ON:JJTWZ:35'
  RFF+PL:V7'
  RFF+VN:8MeM5c9Eud:7'
  UNS+S'
  MOA+125:4429.80'
  MOA+131:492.20'
  MOA+176:1107.45'
  MOA+259:0.00'
  MOA+260:492.20'
  MOA+77:4922.00'
  MOA+79:4429.80'
  MOA+86:5537.25'
  CNT+1:27.0'
  CNT+2:7'
  UNT+216+SGU8Gtp6jW'
  UNZ+1+1'
  """

  test "parse empty" do
    assert EdifactParser.parse("") == {:ok, %{}}
  end

  test "parse one message" do
    assert {:ok, %{
      # UNA:+.? '
      "UNA" => %{"S000" => %{
        "S000a" => %{"desc" => "Component seperator", "val" => ":"},
        "S000b" => %{"desc" => "Element seperator", "val" => "+"},
        "S000c" => %{"desc" => "Decimal seperator", "val" => "."},
        "S000d" => %{"desc" => "Release character", "val" => "?"},
        "S000e" => %{"desc" => "Segment seperator", "val" => "’"},
        "desc" => "TOKEN DEFINITIONS"
      }},
      # UNOC:1+tiJE1VCm1dJ4j5Tv:92+hsae4K0Nl0ZsAmCU:14+170829:1425+1+1'
      "UNB" => %{
        "S001" => %{
          "0001" => %{"val" => "UNOC", "desc" => "Syntax identifier", "qualifier_desc" => "UN/ECE level C"},
          "0002" => %{"val" => "1", "desc" => "Syntax version number"},
          "desc" => "SYNTAX IDENTIFIER"
        },
        "S002" => %{
          "0004" => %{"val" => "tiJE1VCm1dJ4j5Tv", "desc" => "Sender identification"},
          "0007" => %{"val" => "92", "desc" => "Partner identification code qualifier", "qualifier_desc" => "Assigned by buyer or buyer's agent"},
          "desc" => "INTERCHANGE SENDER"
        },
        "S003" => %{
          "0010" => %{"val" => "hsae4K0Nl0ZsAmCU", "desc" => "Recipient identification"},
          "0007" => %{"val" => "14", "desc" => "Partner identification code qualifier", "qualifier_desc" => "EAN International"},
          "desc" => "INTERCHANGE RECIPIENT"
        },
        "S004" => %{
          "0017" => %{"val" => "170829", "desc" => "Date of preparation"},
          "0019" => %{"val" => "1425", "desc" => "Time of preparation"},
          "desc" => "DATE/TIME OF PREPARATION"
        },
        "0020" => %{"val" => "1", "desc" => "INTERCHANGE CONTROL REFERENCE"},
        "S005" => %{
          "0022" => %{"val" => "1", "desc" => "Recipient's reference/password"},
          "desc" => "RECIPIENT'S REFERENCE, PASSWORD"
        }
      },
      "UNH" => [
        %{
          # UNH+SGU8Gtp6jW+ORDRSP:D:96A:UN:EAN005'
          "UNH" => %{
            "0062" => %{"val" => "SGU8Gtp6jW", "desc" => "Message reference number"},
            "S009" => %{
              "0065" => %{"val" => "ORDRSP", "desc" => "Message type", "qualifier_desc" => "Purchase order response message"},
              "0052" => %{"val" => "D", "desc" => "Message version number", "qualifier_desc" => "Draft version/UN/EDIFACT Directory"},
              "0054" => %{"val" => "96A", "desc" => "Message release number", "qualifier_desc" => "Release 1996 - A"},
              "0051" => %{"val" => "UN", "desc" => "Controlling agency, coded", "qualifier_desc" => "UN/CEFACT"},
              "0057" => %{"val" => "EAN005", "desc" => "Association assigned code"},
              "desc" => "MESSAGE IDENTIFIER"
            }
          },
          #BGM+231+Vu1BWIIafc+28'
          "BGM" => %{
            "C002" => %{
              "1001" => %{"val" => "231", "desc" => "Document/message name, coded", "qualifier_desc" => ""},
              "desc" => "DOCUMENT/MESSAGE NAME"
            },
            "1004" => %{"val" => "Vu1BWIIafc", "desc" => "Document/message number"},
            "1225" => %{"val" => "28", "desc" => "Message function, coded", "qualifier_desc" => ""},
          },
          "DTM" => [
            # DTM+137:20170829:102'
            %{
              "C507" => %{
                "2005" => %{"val" => "137", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                "2380" => %{"val" => "20170829", "desc" => "Date/time/period"},
                "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                "desc" => "DATE/TIME/PERIOD"
              }
            },
            # DTM+2:201708021117:203'
            %{
              "C507" => %{
                "2005" => %{"val" => "2", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                "2380" => %{"val" => "201708021117", "desc" => "Date/time/period"},
                "2379" => %{"val" => "203", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                "desc" => "DATE/TIME/PERIOD"
              }
            }
          ],
          "RFF" => [
            %{
              # RFF+CR'
              "RFF" => %{
                "C506" => %{
                  "1153" => %{"val" => "CR", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                  "desc" => "REFERENCE"
                },
              },
              # DTM+171:20170802:102'
              "DTM" => [%{
                "C507" => %{
                  "2005" => %{"val" => "171", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                  "2380" => %{"val" => "20170802", "desc" => "Date/time/period"},
                  "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                  "desc" => "DATE/TIME/PERIOD"
                }
              }]
            },
            %{
              # RFF+ON:JJTWZ'
              "RFF" => %{
                "C506" => %{
                  "1153" => %{"val" => "ON", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                  "1154" => %{"val" => "JJTWZ", "desc" => "Reference number"},
                  "desc" => "REFERENCE"
                },
              },
              # DTM+171:20170802:102'
              "DTM" => [%{
                "C507" => %{
                  "2005" => %{"val" => "171", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                  "2380" => %{"val" => "20170802", "desc" => "Date/time/period"},
                  "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                  "desc" => "DATE/TIME/PERIOD"
                }
              }]
            },
            %{
              # RFF+VN:8MeM5c9Eud'
              "RFF" => %{
                "C506" => %{
                  "1153" => %{"val" => "VN", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                  "1154" => %{"val" => "8MeM5c9Eud", "desc" => "Reference number"},
                  "desc" => "REFERENCE"
                },
              },
              # DTM+171:20170802:102'
              "DTM" => [%{
                "C507" => %{
                  "2005" => %{"val" => "171", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                  "2380" => %{"val" => "20170802", "desc" => "Date/time/period"},
                  "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                  "desc" => "DATE/TIME/PERIOD"
                }
              }]
            },
          ],
          "NAD" => [
            # NAD+BY+mgv7uM8hH7hM9::9++Buyer Buyerson+Buyer Street 1+Buyersburg++11111+SE'
            %{
              "NAD" => %{
                "3035" => %{"val" => "BY", "desc" => "Party qualifier", "qualifier_desc" => ""},
                "C082" => %{
                  "3039" => %{"val" => "mgv7uM8hH7hM9", "desc" => "Party id. identification"},
                  "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                  "3055" => %{"val" => "9", "desc" => "Code list responsible agency, coded", "qualifier_desc" => ""},
                  "desc" => "PARTY IDENTIFICATION DETAILS"
                },
                "C058" => %{"3124" => [%{"val" => "", "desc" => "Name and address line"}], "desc" => "NAME AND ADDRESS"},
                "C080" => %{
                  "3036" => [%{"val" => "Buyer Buyerson", "desc" => "Party name"}],
                  "desc" => "PARTY NAME"
                },
                "C059" => %{
                  "3042" => [%{"val" => "Buyer Street 1", "desc" => "Street and number/p.o. box"}],
                  "desc" => "STREET"
                },
                "3164" => %{"val" => "Buyersburg", "desc" => "City name"},
                "3229" => %{"val" => "", "desc" => "Country sub-entity identification"},
                "3251" => %{"val" => "11111", "desc" => "Postcode identification"},
                "3207" => %{"val" => "SE", "desc" => "Country, coded"},
              }
            },
            # NAD+DP+WtVsJR9O8ReDL::9++Delivery Partyson+Delivery Street 2+Partysburg++22222+SE'
            %{
              "NAD" => %{
                "3035" => %{"val" => "DP", "desc" => "Party qualifier", "qualifier_desc" => ""},
                "C082" => %{
                  "3039" => %{"val" => "WtVsJR9O8ReDL", "desc" => "Party id. identification"},
                  "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                  "3055" => %{"val" => "9", "desc" => "Code list responsible agency, coded", "qualifier_desc" => ""},
                  "desc" => "PARTY IDENTIFICATION DETAILS"
                },
                "C058" => %{"3124" => [%{"val" => "", "desc" => "Name and address line"}], "desc" => "NAME AND ADDRESS"},
                "C080" => %{
                  "3036" => [%{"val" => "Delivery Partyson", "desc" => "Party name"}],
                  "desc" => "PARTY NAME"
                },
                "C059" => %{
                  "3042" => [%{"val" => "Delivery Street 2", "desc" => "Street and number/p.o. box"}],
                  "desc" => "STREET"
                },
                "3164" => %{"val" => "Partysburg", "desc" => "City name"},
                "3229" => %{"val" => "", "desc" => "Country sub-entity identification"},
                "3251" => %{"val" => "22222", "desc" => "Postcode identification"},
                "3207" => %{"val" => "SE", "desc" => "Country, coded"},
              }
            },
            # NAD+IV+UOHipyUD9amRR::9++Invoicee Invoison+Invoice Street 3+Invoiceburge++33333+SE'
            %{
              "NAD" => %{
                "3035" => %{"val" => "IV", "desc" => "Party qualifier", "qualifier_desc" => ""},
                "C082" => %{
                  "3039" => %{"val" => "UOHipyUD9amRR", "desc" => "Party id. identification"},
                  "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                  "3055" => %{"val" => "9", "desc" => "Code list responsible agency, coded", "qualifier_desc" => ""},
                  "desc" => "PARTY IDENTIFICATION DETAILS"
                },
                "C058" => %{"3124" => [%{"val" => "", "desc" => "Name and address line"}], "desc" => "NAME AND ADDRESS"},
                "C080" => %{
                  "3036" => [%{"val" => "Invoicee Invoison", "desc" => "Party name"}],
                  "desc" => "PARTY NAME"
                },
                "C059" => %{
                  "3042" => [%{"val" => "Invoice Street 3", "desc" => "Street and number/p.o. box"}],
                  "desc" => "STREET"
                },
                "3164" => %{"val" => "Invoiceburge", "desc" => "City name"},
                "3229" => %{"val" => "", "desc" => "Country sub-entity identification"},
                "3251" => %{"val" => "33333", "desc" => "Postcode identification"},
                "3207" => %{"val" => "SE", "desc" => "Country, coded"},
              }
            },
            %{
              # NAD+SU+5DnEnBDKl3IHi::9++Supplier Supplierson+Suppliers Street 4+Suppliersburg++44444+SE'
              "NAD" => %{
                "3035" => %{"val" => "SU", "desc" => "Party qualifier", "qualifier_desc" => ""},
                "C082" => %{
                  "3039" => %{"val" => "5DnEnBDKl3IHi", "desc" => "Party id. identification"},
                  "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                  "3055" => %{"val" => "9", "desc" => "Code list responsible agency, coded", "qualifier_desc" => ""},
                  "desc" => "PARTY IDENTIFICATION DETAILS"
                },
                "C058" => %{"3124" => [%{"val" => "", "desc" => "Name and address line"}], "desc" => "NAME AND ADDRESS"},
                "C080" => %{
                  "3036" => [%{"val" => "Supplier Supplierson", "desc" => "Party name"}],
                  "desc" => "PARTY NAME"
                },
                "C059" => %{
                  "3042" => [%{"val" => "Suppliers Street 4", "desc" => "Street and number/p.o. box"}],
                  "desc" => "STREET"
                },
                "3164" => %{"val" => "Suppliersburg", "desc" => "City name"},
                "3229" => %{"val" => "", "desc" => "Country sub-entity identification"},
                "3251" => %{"val" => "44444", "desc" => "Postcode identification"},
                "3207" => %{"val" => "SE", "desc" => "Country, coded"},
              },
              # RFF+VA:R58lfbMP8r9b'
              "RFF" => [
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "VA", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "R58lfbMP8r9b", "desc" => "Reference number"},
                      "desc" => "REFERENCE"
                    },
                  },
                }
              ],
              "CTA" => [
                %{
                  # CTA+IC+:Employee Employeeson'
                  "CTA" => %{
                    "3139" => %{"val" => "IC", "desc" => "Contact function, coded", "qualifier_desc" => ""},
                    "C056" => %{
                      "3413" => %{"val" => "", "desc" => "Department or employee identification"},
                      "3412" => %{"val" => "Employee Employeeson", "desc" => "Department or employee"},
                      "desc" => "DEPARTMENT OR EMPLOYEE DETAILS"
                    }
                  },
                  # COM+?+4640123456:FX'
                  # COM+?+4640654321:TE'
                  "COM" => [
                    %{
                      "C076" => %{
                        "3148" => %{"val" => "+4640123456", "desc" => "Communication number"},
                        "3155" => %{"val" => "FX", "desc" => "Communication channel qualifier", "qualifier_desc" => ""},
                        "desc" => "COMMUNICATION CONTACT"
                      }
                    },
                    %{
                      "C076" => %{
                        "3148" => %{"val" => "+4640654321", "desc" => "Communication number"},
                        "3155" => %{"val" => "TE", "desc" => "Communication channel qualifier", "qualifier_desc" => ""},
                        "desc" => "COMMUNICATION CONTACT"
                      }
                    }
                  ]
                }
              ]
            },
          ],
          # CUX+2:SEK:9'
          "CUX" => [
            %{
              "CUX" => %{
                "C504" => [
                  %{
                    "6347" => %{"val" => "2", "desc" => "Currency details qualifier", "qualifier_desc" => ""},
                    "6345" => %{"val" => "SEK", "desc" => "Currency, coded"},
                    "6343" => %{"val" => "9", "desc" => "Currency qualifier", "qualifier_desc" => ""},
                    "desc" => "CURRENCY DETAILS"
                  }
                ]
              }
            }
          ],
          # PAT+1+6:ZZZ::30 dagar'
          "PAT" => [
            %{
              "PAT" => %{
                "4279" => %{"val" => "1", "desc" => "Payment terms type qualifier", "qualifier_desc" => ""},
                "C110" => %{
                  "4277" => %{"val" => "6", "desc" => "Terms of payment identification", "qualifier_desc" => ""},
                  "1131" => %{"val" => "ZZZ", "desc" => "Code list qualifier", "qualifier_desc" => ""},
                  "3055" => %{"desc" => "Code list responsible agency, coded", "val" => ""},
                  "4276" => [%{"val" => "30 dagar", "desc" => "Terms of payment"}],
                  "desc" => "PAYMENT TERMS",
                }
              }
            }
          ],
          # TDT+20++003'
          "TDT" => [
            %{
              "TDT" => %{
                "8051" => %{"val" => "20", "desc" => "Transport stage qualifier", "qualifier_desc" => ""},
                "8028" => %{"val" => "", "desc" => "Conveyance reference number"},
                "C220" => %{
                  "8067" => %{"val" => "003", "desc" => "Mode of transport, coded"},
                  "desc" => "MODE OF TRANSPORT"
                }
              }
            }
          ],
          # TOD+3++FCA'
          "TOD" => [
            %{
              "TOD" => %{
                "4055" => %{"val" => "3", "desc" => "Terms of delivery or transport function, coded", "qualifier_desc" => ""},
                "4215" => %{"val" => "", "desc" => "Transport charges method of payment, coded"},
                "C100" => %{
                  "4053" => %{"val" => "FCA", "desc" => "Terms of delivery or transport, coded"},
                  "desc" => "TERMS OF DELIVERY OR TRANSPORT"
                }
              }
            }
          ],
          "LIN" => [
            %{
              # LIN+1+5+0123456789012:EN'
              "LIN" => %{
                "1082" => %{"val" => "1", "desc" => "Line item number"},
                "1229" => %{"val" => "5", "desc" => "Action request/notification, coded", "qualifier_desc" => ""},
                "C212" => %{
                  "7140" => %{"val" => "0123456789012", "desc" => "Item number"},
                  "7143" => %{"val" => "EN", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                  "desc" => "ITEM NUMBER IDENTIFICATION"
                }
              },
              # PIA+1+V12345678:SA::91+0123456789012:IN::92'
              "PIA" => [
                %{
                  "4347" => %{"val" => "1", "desc" => "Product id. function qualifier", "qualifier_desc" => ""},
                  "C212" => [
                    %{
                      "7140" => %{"val" => "V12345678", "desc" => "Item number"},
                      "7143" => %{"val" => "SA", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                      "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                      "3055" => %{"val" => "91", "desc" => "Code list responsible agency, coded", "qualifier_desc" => ""},
                      "desc" => "ITEM NUMBER IDENTIFICATION"
                    },
                    %{
                      "7140" => %{"val" => "0123456789012", "desc" => "Item number"},
                      "7143" => %{"val" => "IN", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                      "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                      "3055" => %{"val" => "92", "desc" => "Code list responsible agency, coded", "qualifier_desc" => ""},
                      "desc" => "ITEM NUMBER IDENTIFICATION"
                    }
                  ]
                }
              ],
              # IMD+F++:::Product one'
              "IMD" => [
                %{
                  "7077" => %{"val" => "F", "desc" => "Item description type, coded", "qualifier_desc" => ""},
                  "7081" => %{"val" => "", "desc" => "Item characteristic, coded"},
                  "C273" => %{
                    "7009" => %{"val" => "", "desc" => "Item description identification"},
                    "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                    "3055" => %{"val" => "", "desc" => "Code list responsible agency, coded"},
                    "7008" => [%{"val" => "Product one", "desc" => "Item description"}],
                    "desc" => "ITEM DESCRIPTION"
                  }
                }
              ],
              # QTY+21:1:PCE'
              # QTY+113:1:PCE'
              # QTY+47:1:PCE'
              "QTY" => [
                %{
                  "C186" => %{
                    "6063" => %{"val" => "21", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "1", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
                %{
                  "C186" => %{
                    "6063" => %{"val" => "113", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "1", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
                %{
                  "C186" => %{
                    "6063" => %{"val" => "47", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "1", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
              ],
              "DTM" => [
                # DTM+2:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "2", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+64:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "64", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+69:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "69", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+85:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "85", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
              ],
              # MOA+203:306.00'
              "MOA" => [
                %{
                  "C516" => %{
                    "5025" => %{"val" => "203", "desc" => "Monetary amount type qualifier", "qualifier_desc" => ""},
                    "5004" => %{"val" => "306.00", "desc" => "Monetary amount"},
                    "desc" => "MONETARY AMOUNT"
                  }
                }
              ],
              "PRI" => [
                # PRI+AAA:306.00::::STK'
                %{
                  "PRI" => %{
                    "C509" => %{
                      "5125" => %{"val" => "AAA", "desc" => "Price qualifier", "qualifier_desc" => ""},
                      "5118" => %{"val" => "306.00", "desc" => "Price"},
                      "5375" => %{"val" => "", "desc" => "Price type, coded"},
                      "5387" => %{"val" => "", "desc" => "Price type qualifier"},
                      "5284" => %{"val" => "", "desc" => "Unit price basis"},
                      "6411" => %{"val" => "STK", "desc" => "Measure unit qualifier"},
                      "desc" => "PRICE INFORMATION"
                    }
                  }
                },
                # PRI+AAB:340.00::::STK'
                %{
                  "PRI" => %{
                    "C509" => %{
                      "5125" => %{"val" => "AAB", "desc" => "Price qualifier", "qualifier_desc" => ""},
                      "5118" => %{"val" => "340.00", "desc" => "Price"},
                      "5375" => %{"val" => "", "desc" => "Price type, coded"},
                      "5387" => %{"val" => "", "desc" => "Price type qualifier"},
                      "5284" => %{"val" => "", "desc" => "Unit price basis"},
                      "6411" => %{"val" => "STK", "desc" => "Measure unit qualifier"},
                      "desc" => "PRICE INFORMATION"
                    }
                  }
                },
              ],
              "RFF" => [
                # RFF+ON:JJTWZ:5'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "ON", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "JJTWZ", "desc" => "Reference number"},
                      "1156" => %{"val" => "5", "desc" => "Line number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
                # RFF+PL:V7'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "PL", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "V7", "desc" => "Reference number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
                # RFF+VN:8MeM5c9Eud:1'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "VN", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "8MeM5c9Eud", "desc" => "Reference number"},
                      "1156" => %{"val" => "1", "desc" => "Line number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
              ],
            },
            %{
              # LIN+2+5+0123456789012:EN'
              "LIN" => %{
                "1082" => %{"val" => "2", "desc" => "Line item number"},
                "1229" => %{"val" => "5", "desc" => "Action request/notification, coded", "qualifier_desc" => ""},
                "C212" => %{
                  "7140" => %{"val" => "0123456789012", "desc" => "Item number"},
                  "7143" => %{"val" => "EN", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                  "desc" => "ITEM NUMBER IDENTIFICATION"
                }
              },
              # PIA+1+V12345678:SA::91+0123456789012:IN::92'
              "PIA" => [
                %{
                  "4347" => %{"val" => "1", "desc" => "Product id. function qualifier", "qualifier_desc" => ""},
                  "C212" => [
                    %{
                      "7140" => %{"val" => "V12345678", "desc" => "Item number"},
                      "7143" => %{"val" => "SA", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                      "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                      "3055" => %{"val" => "91", "desc" => "Code list responsible agency, coded", "qualifier_desc" => ""},
                      "desc" => "ITEM NUMBER IDENTIFICATION"
                    },
                    %{
                      "7140" => %{"val" => "0123456789012", "desc" => "Item number"},
                      "7143" => %{"val" => "IN", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                      "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                      "3055" => %{"val" => "92", "desc" => "Code list responsible agency, coded", "qualifier_desc" => ""},
                      "desc" => "ITEM NUMBER IDENTIFICATION"
                    }
                  ]
                }
              ],
              # IMD+F++:::Product two'
              "IMD" => [
                %{
                  "7077" => %{"val" => "F", "desc" => "Item description type, coded", "qualifier_desc" => ""},
                  "7081" => %{"val" => "", "desc" => "Item characteristic, coded"},
                  "C273" => %{
                    "7009" => %{"val" => "", "desc" => "Item description identification"},
                    "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                    "3055" => %{"val" => "", "desc" => "Code list responsible agency, coded"},
                    "7008" => [%{"val" => "Product two", "desc" => "Item description"}],
                    "desc" => "ITEM DESCRIPTION"
                  }
                }
              ],
              "QTY" => [
                # QTY+21:1:PCE'
                %{
                  "C186" => %{
                    "6063" => %{"val" => "21", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "1", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
                # QTY+113:1:PCE'
                %{
                  "C186" => %{
                    "6063" => %{"val" => "113", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "1", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
                # QTY+47:1:PCE'
                %{
                  "C186" => %{
                    "6063" => %{"val" => "47", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "1", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
              ],
              "DTM" => [
                # DTM+2:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "2", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+64:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "64", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+69:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "69", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+85:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "85", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
              ],
              # MOA+203:614.70'
              "MOA" => [
                %{
                  "C516" => %{
                    "5025" => %{"val" => "203", "desc" => "Monetary amount type qualifier", "qualifier_desc" => ""},
                    "5004" => %{"val" => "614.70", "desc" => "Monetary amount"},
                    "desc" => "MONETARY AMOUNT"
                  }
                }
              ],
              "PRI" => [
                # PRI+AAA:614.70::::STK'
                %{
                  "PRI" => %{
                    "C509" => %{
                      "5125" => %{"val" => "AAA", "desc" => "Price qualifier", "qualifier_desc" => ""},
                      "5118" => %{"val" => "614.70", "desc" => "Price"},
                      "5375" => %{"val" => "", "desc" => "Price type, coded"},
                      "5387" => %{"val" => "", "desc" => "Price type qualifier"},
                      "5284" => %{"val" => "", "desc" => "Unit price basis"},
                      "6411" => %{"val" => "STK", "desc" => "Measure unit qualifier"},
                      "desc" => "PRICE INFORMATION"
                    }
                  }
                },
                # PRI+AAB:683.00::::STK'
                %{
                  "PRI" => %{
                    "C509" => %{
                      "5125" => %{"val" => "AAB", "desc" => "Price qualifier", "qualifier_desc" => ""},
                      "5118" => %{"val" => "683.00", "desc" => "Price"},
                      "5375" => %{"val" => "", "desc" => "Price type, coded"},
                      "5387" => %{"val" => "", "desc" => "Price type qualifier"},
                      "5284" => %{"val" => "", "desc" => "Unit price basis"},
                      "6411" => %{"val" => "STK", "desc" => "Measure unit qualifier"},
                      "desc" => "PRICE INFORMATION"
                    }
                  }
                },
              ],
              "RFF" => [
                # RFF+ON:JJTWZ:10'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "ON", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "JJTWZ", "desc" => "Reference number"},
                      "1156" => %{"val" => "10", "desc" => "Line number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
                # RFF+PL:V7'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "PL", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "V7", "desc" => "Reference number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
                # RFF+VN:8MeM5c9Eud:2'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "VN", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "8MeM5c9Eud", "desc" => "Reference number"},
                      "1156" => %{"val" => "2", "desc" => "Line number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
              ],
            },
            %{
              # LIN+3+5+0123456789012:EN'
              "LIN" => %{
                "1082" => %{"val" => "3", "desc" => "Line item number"},
                "1229" => %{"val" => "5", "desc" => "Action request/notification, coded", "qualifier_desc" => ""},
                "C212" => %{
                  "7140" => %{"val" => "0123456789012", "desc" => "Item number"},
                  "7143" => %{"val" => "EN", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                  "desc" => "ITEM NUMBER IDENTIFICATION"
                }
              },
              # PIA+1+V12345678:SA::91+0123456789012:IN::92'
              "PIA" => [
                %{
                  "4347" => %{"val" => "1", "desc" => "Product id. function qualifier", "qualifier_desc" => ""},
                  "C212" => [
                    %{
                      "7140" => %{"val" => "V12345678", "desc" => "Item number"},
                      "7143" => %{"val" => "SA", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                      "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                      "3055" => %{"val" => "91", "desc" => "Code list responsible agency, coded", "qualifier_desc" => ""},
                      "desc" => "ITEM NUMBER IDENTIFICATION"
                    },
                    %{
                      "7140" => %{"val" => "0123456789012", "desc" => "Item number"},
                      "7143" => %{"val" => "IN", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                      "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                      "3055" => %{"val" => "92", "desc" => "Code list responsible agency, coded", "qualifier_desc" => ""},
                      "desc" => "ITEM NUMBER IDENTIFICATION"
                    }
                  ]
                }
              ],
              # IMD+F++:::Product three'
              "IMD" => [
                %{
                  "7077" => %{"val" => "F", "desc" => "Item description type, coded", "qualifier_desc" => ""},
                  "7081" => %{"val" => "", "desc" => "Item characteristic, coded"},
                  "C273" => %{
                    "7009" => %{"val" => "", "desc" => "Item description identification"},
                    "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                    "3055" => %{"val" => "", "desc" => "Code list responsible agency, coded"},
                    "7008" => [%{"val" => "Product three", "desc" => "Item description"}],
                    "desc" => "ITEM DESCRIPTION"
                  }
                }
              ],
              "QTY" => [
                # QTY+21:1:PCE'
                %{
                  "C186" => %{
                    "6063" => %{"val" => "21", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "1", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
                # QTY+113:1:PCE'
                %{
                  "C186" => %{
                    "6063" => %{"val" => "113", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "1", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
                # QTY+47:1:PCE'
                %{
                  "C186" => %{
                    "6063" => %{"val" => "47", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "1", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
              ],
              "DTM" => [
                # DTM+2:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "2", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+64:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "64", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+69:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "69", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+85:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "85", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
              ],
              # MOA+203:614.70'
              "MOA" => [
                %{
                  "C516" => %{
                    "5025" => %{"val" => "203", "desc" => "Monetary amount type qualifier", "qualifier_desc" => ""},
                    "5004" => %{"val" => "614.70", "desc" => "Monetary amount"},
                    "desc" => "MONETARY AMOUNT"
                  }
                }
              ],
              "PRI" => [
                # PRI+AAA:614.70::::STK'
                %{
                  "PRI" => %{
                    "C509" => %{
                      "5125" => %{"val" => "AAA", "desc" => "Price qualifier", "qualifier_desc" => ""},
                      "5118" => %{"val" => "614.70", "desc" => "Price"},
                      "5375" => %{"val" => "", "desc" => "Price type, coded"},
                      "5387" => %{"val" => "", "desc" => "Price type qualifier"},
                      "5284" => %{"val" => "", "desc" => "Unit price basis"},
                      "6411" => %{"val" => "STK", "desc" => "Measure unit qualifier"},
                      "desc" => "PRICE INFORMATION"
                    }
                  }
                },
                # PRI+AAB:683.00::::STK'
                %{
                  "PRI" => %{
                    "C509" => %{
                      "5125" => %{"val" => "AAB", "desc" => "Price qualifier", "qualifier_desc" => ""},
                      "5118" => %{"val" => "683.00", "desc" => "Price"},
                      "5375" => %{"val" => "", "desc" => "Price type, coded"},
                      "5387" => %{"val" => "", "desc" => "Price type qualifier"},
                      "5284" => %{"val" => "", "desc" => "Unit price basis"},
                      "6411" => %{"val" => "STK", "desc" => "Measure unit qualifier"},
                      "desc" => "PRICE INFORMATION"
                    }
                  }
                },
              ],
              "RFF" => [
                # RFF+ON:JJTWZ:15'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "ON", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "JJTWZ", "desc" => "Reference number"},
                      "1156" => %{"val" => "15", "desc" => "Line number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
                # RFF+PL:V7'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "PL", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "V7", "desc" => "Reference number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
                # RFF+VN:8MeM5c9Eud:3'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "VN", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "8MeM5c9Eud", "desc" => "Reference number"},
                      "1156" => %{"val" => "3", "desc" => "Line number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
              ],
            },
            %{
              # LIN+4+5+0123456789012:EN'
              "LIN" => %{
                "1082" => %{"val" => "4", "desc" => "Line item number"},
                "1229" => %{"val" => "5", "desc" => "Action request/notification, coded", "qualifier_desc" => ""},
                "C212" => %{
                  "7140" => %{"val" => "0123456789012", "desc" => "Item number"},
                  "7143" => %{"val" => "EN", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                  "desc" => "ITEM NUMBER IDENTIFICATION"
                }
              },
              # PIA+1+V12345678:SA::91+0123456789012:IN::92'
              "PIA" => [
                %{
                  "4347" => %{"val" => "1", "desc" => "Product id. function qualifier", "qualifier_desc" => ""},
                  "C212" => [
                    %{
                      "7140" => %{"val" => "V12345678", "desc" => "Item number"},
                      "7143" => %{"val" => "SA", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                      "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                      "3055" => %{"val" => "91", "desc" => "Code list responsible agency, coded", "qualifier_desc" => ""},
                      "desc" => "ITEM NUMBER IDENTIFICATION"
                    },
                    %{
                      "7140" => %{"val" => "0123456789012", "desc" => "Item number"},
                      "7143" => %{"val" => "IN", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                      "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                      "3055" => %{"val" => "92", "desc" => "Code list responsible agency, coded", "qualifier_desc" => ""},
                      "desc" => "ITEM NUMBER IDENTIFICATION"
                    }
                  ]
                }
              ],
              # IMD+F++:::Product four'
              "IMD" => [
                %{
                  "7077" => %{"val" => "F", "desc" => "Item description type, coded", "qualifier_desc" => ""},
                  "7081" => %{"val" => "", "desc" => "Item characteristic, coded"},
                  "C273" => %{
                    "7009" => %{"val" => "", "desc" => "Item description identification"},
                    "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                    "3055" => %{"val" => "", "desc" => "Code list responsible agency, coded"},
                    "7008" => [%{"val" => "Product four", "desc" => "Item description"}],
                    "desc" => "ITEM DESCRIPTION"
                  }
                }
              ],
              "QTY" => [
                # QTY+21:1:PCE'
                %{
                  "C186" => %{
                    "6063" => %{"val" => "21", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "1", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
                # QTY+113:1:PCE'
                %{
                  "C186" => %{
                    "6063" => %{"val" => "113", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "1", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
                # QTY+47:1:PCE'
                %{
                  "C186" => %{
                    "6063" => %{"val" => "47", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "1", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
              ],
              "DTM" => [
                # DTM+2:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "2", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+64:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "64", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+69:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "69", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+85:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "85", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
              ],
              # MOA+203:882.90'
              "MOA" => [
                %{
                  "C516" => %{
                    "5025" => %{"val" => "203", "desc" => "Monetary amount type qualifier", "qualifier_desc" => ""},
                    "5004" => %{"val" => "882.90", "desc" => "Monetary amount"},
                    "desc" => "MONETARY AMOUNT"
                  }
                }
              ],
              "PRI" => [
                # PRI+AAA:882.90::::STK'
                %{
                  "PRI" => %{
                    "C509" => %{
                      "5125" => %{"val" => "AAA", "desc" => "Price qualifier", "qualifier_desc" => ""},
                      "5118" => %{"val" => "882.90", "desc" => "Price"},
                      "5375" => %{"val" => "", "desc" => "Price type, coded"},
                      "5387" => %{"val" => "", "desc" => "Price type qualifier"},
                      "5284" => %{"val" => "", "desc" => "Unit price basis"},
                      "6411" => %{"val" => "STK", "desc" => "Measure unit qualifier"},
                      "desc" => "PRICE INFORMATION"
                    }
                  }
                },
                # PRI+AAB:981.00::::STK'
                %{
                  "PRI" => %{
                    "C509" => %{
                      "5125" => %{"val" => "AAB", "desc" => "Price qualifier", "qualifier_desc" => ""},
                      "5118" => %{"val" => "981.00", "desc" => "Price"},
                      "5375" => %{"val" => "", "desc" => "Price type, coded"},
                      "5387" => %{"val" => "", "desc" => "Price type qualifier"},
                      "5284" => %{"val" => "", "desc" => "Unit price basis"},
                      "6411" => %{"val" => "STK", "desc" => "Measure unit qualifier"},
                      "desc" => "PRICE INFORMATION"
                    }
                  }
                },
              ],
              "RFF" => [
                # RFF+ON:JJTWZ:20'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "ON", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "JJTWZ", "desc" => "Reference number"},
                      "1156" => %{"val" => "20", "desc" => "Line number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
                # RFF+PL:V7'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "PL", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "V7", "desc" => "Reference number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
                # RFF+VN:8MeM5c9Eud:4'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "VN", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "8MeM5c9Eud", "desc" => "Reference number"},
                      "1156" => %{"val" => "4", "desc" => "Line number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
              ],
            },
            %{
              # LIN+5+5+0123456789012:EN'
              "LIN" => %{
                "1082" => %{"val" => "5", "desc" => "Line item number"},
                "1229" => %{"val" => "5", "desc" => "Action request/notification, coded", "qualifier_desc" => ""},
                "C212" => %{
                  "7140" => %{"val" => "0123456789012", "desc" => "Item number"},
                  "7143" => %{"val" => "EN", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                  "desc" => "ITEM NUMBER IDENTIFICATION"
                }
              },
              # PIA+1+V12345678:SA::91+0123456789012:IN::92'
              "PIA" => [
                %{
                  "4347" => %{"val" => "1", "desc" => "Product id. function qualifier", "qualifier_desc" => ""},
                  "C212" => [
                    %{
                      "7140" => %{"val" => "V12345678", "desc" => "Item number"},
                      "7143" => %{"val" => "SA", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                      "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                      "3055" => %{"val" => "91", "desc" => "Code list responsible agency, coded", "qualifier_desc" => ""},
                      "desc" => "ITEM NUMBER IDENTIFICATION"
                    },
                    %{
                      "7140" => %{"val" => "0123456789012", "desc" => "Item number"},
                      "7143" => %{"val" => "IN", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                      "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                      "3055" => %{"val" => "92", "desc" => "Code list responsible agency, coded", "qualifier_desc" => ""},
                      "desc" => "ITEM NUMBER IDENTIFICATION"
                    }
                  ]
                }
              ],
              # IMD+F++:::Product five'
              "IMD" => [
                %{
                  "7077" => %{"val" => "F", "desc" => "Item description type, coded", "qualifier_desc" => ""},
                  "7081" => %{"val" => "", "desc" => "Item characteristic, coded"},
                  "C273" => %{
                    "7009" => %{"val" => "", "desc" => "Item description identification"},
                    "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                    "3055" => %{"val" => "", "desc" => "Code list responsible agency, coded"},
                    "7008" => [%{"val" => "Product five", "desc" => "Item description"}],
                    "desc" => "ITEM DESCRIPTION"
                  }
                }
              ],
              "QTY" => [
                # QTY+21:2:PCE'
                %{
                  "C186" => %{
                    "6063" => %{"val" => "21", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "2", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
                # QTY+113:2:PCE'
                %{
                  "C186" => %{
                    "6063" => %{"val" => "113", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "2", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
                # QTY+47:2:PCE'
                %{
                  "C186" => %{
                    "6063" => %{"val" => "47", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "2", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
              ],
              "DTM" => [
                # DTM+2:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "2", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+64:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "64", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+69:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "69", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+85:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "85", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
              ],
              # MOA+203:941.40'
              "MOA" => [
                %{
                  "C516" => %{
                    "5025" => %{"val" => "203", "desc" => "Monetary amount type qualifier", "qualifier_desc" => ""},
                    "5004" => %{"val" => "941.40", "desc" => "Monetary amount"},
                    "desc" => "MONETARY AMOUNT"
                  }
                }
              ],
              "PRI" => [
                # PRI+AAA:470.70::::STK'
                %{
                  "PRI" => %{
                    "C509" => %{
                      "5125" => %{"val" => "AAA", "desc" => "Price qualifier", "qualifier_desc" => ""},
                      "5118" => %{"val" => "470.70", "desc" => "Price"},
                      "5375" => %{"val" => "", "desc" => "Price type, coded"},
                      "5387" => %{"val" => "", "desc" => "Price type qualifier"},
                      "5284" => %{"val" => "", "desc" => "Unit price basis"},
                      "6411" => %{"val" => "STK", "desc" => "Measure unit qualifier"},
                      "desc" => "PRICE INFORMATION"
                    }
                  }
                },
                # PRI+AAB:523.00::::STK'
                %{
                  "PRI" => %{
                    "C509" => %{
                      "5125" => %{"val" => "AAB", "desc" => "Price qualifier", "qualifier_desc" => ""},
                      "5118" => %{"val" => "523.00", "desc" => "Price"},
                      "5375" => %{"val" => "", "desc" => "Price type, coded"},
                      "5387" => %{"val" => "", "desc" => "Price type qualifier"},
                      "5284" => %{"val" => "", "desc" => "Unit price basis"},
                      "6411" => %{"val" => "STK", "desc" => "Measure unit qualifier"},
                      "desc" => "PRICE INFORMATION"
                    }
                  }
                },
              ],
              "RFF" => [
                # RFF+ON:JJTWZ:25'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "ON", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "JJTWZ", "desc" => "Reference number"},
                      "1156" => %{"val" => "25", "desc" => "Line number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
                # RFF+PL:V7'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "PL", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "V7", "desc" => "Reference number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
                # RFF+VN:8MeM5c9Eud:5'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "VN", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "8MeM5c9Eud", "desc" => "Reference number"},
                      "1156" => %{"val" => "5", "desc" => "Line number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
              ],
            },
            %{
              # LIN+6+5+0123456789012:EN'
              "LIN" => %{
                "1082" => %{"val" => "6", "desc" => "Line item number"},
                "1229" => %{"val" => "5", "desc" => "Action request/notification, coded", "qualifier_desc" => ""},
                "C212" => %{
                  "7140" => %{"val" => "0123456789012", "desc" => "Item number"},
                  "7143" => %{"val" => "EN", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                  "desc" => "ITEM NUMBER IDENTIFICATION"
                }
              },
              # PIA+1+V12345678:SA::91+0123456789012:IN::92'
              "PIA" => [
                %{
                  "4347" => %{"val" => "1", "desc" => "Product id. function qualifier", "qualifier_desc" => ""},
                  "C212" => [
                    %{
                      "7140" => %{"val" => "V12345678", "desc" => "Item number"},
                      "7143" => %{"val" => "SA", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                      "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                      "3055" => %{"val" => "91", "desc" => "Code list responsible agency, coded", "qualifier_desc" => ""},
                      "desc" => "ITEM NUMBER IDENTIFICATION"
                    },
                    %{
                      "7140" => %{"val" => "0123456789012", "desc" => "Item number"},
                      "7143" => %{"val" => "IN", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                      "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                      "3055" => %{"val" => "92", "desc" => "Code list responsible agency, coded", "qualifier_desc" => ""},
                      "desc" => "ITEM NUMBER IDENTIFICATION"
                    }
                  ]
                }
              ],
              # IMD+F++:::Product six'
              "IMD" => [
                %{
                  "7077" => %{"val" => "F", "desc" => "Item description type, coded", "qualifier_desc" => ""},
                  "7081" => %{"val" => "", "desc" => "Item characteristic, coded"},
                  "C273" => %{
                    "7009" => %{"val" => "", "desc" => "Item description identification"},
                    "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                    "3055" => %{"val" => "", "desc" => "Code list responsible agency, coded"},
                    "7008" => [%{"val" => "Product six", "desc" => "Item description"}],
                    "desc" => "ITEM DESCRIPTION"
                  }
                }
              ],
              "QTY" => [
                # QTY+21:1:PCE'
                %{
                  "C186" => %{
                    "6063" => %{"val" => "21", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "1", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
                # QTY+113:1:PCE'
                %{
                  "C186" => %{
                    "6063" => %{"val" => "113", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "1", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
                # QTY+47:1:PCE'
                %{
                  "C186" => %{
                    "6063" => %{"val" => "47", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "1", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
              ],
              "DTM" => [
                # DTM+2:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "2", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+64:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "64", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+69:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "69", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+85:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "85", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
              ],
              # MOA+203:720.90'
              "MOA" => [
                %{
                  "C516" => %{
                    "5025" => %{"val" => "203", "desc" => "Monetary amount type qualifier", "qualifier_desc" => ""},
                    "5004" => %{"val" => "720.90", "desc" => "Monetary amount"},
                    "desc" => "MONETARY AMOUNT"
                  }
                }
              ],
              "PRI" => [
                # PRI+AAA:720.90::::STK'
                %{
                  "PRI" => %{
                    "C509" => %{
                      "5125" => %{"val" => "AAA", "desc" => "Price qualifier", "qualifier_desc" => ""},
                      "5118" => %{"val" => "720.90", "desc" => "Price"},
                      "5375" => %{"val" => "", "desc" => "Price type, coded"},
                      "5387" => %{"val" => "", "desc" => "Price type qualifier"},
                      "5284" => %{"val" => "", "desc" => "Unit price basis"},
                      "6411" => %{"val" => "STK", "desc" => "Measure unit qualifier"},
                      "desc" => "PRICE INFORMATION"
                    }
                  }
                },
                # PRI+AAB:801.00::::STK'
                %{
                  "PRI" => %{
                    "C509" => %{
                      "5125" => %{"val" => "AAB", "desc" => "Price qualifier", "qualifier_desc" => ""},
                      "5118" => %{"val" => "801.00", "desc" => "Price"},
                      "5375" => %{"val" => "", "desc" => "Price type, coded"},
                      "5387" => %{"val" => "", "desc" => "Price type qualifier"},
                      "5284" => %{"val" => "", "desc" => "Unit price basis"},
                      "6411" => %{"val" => "STK", "desc" => "Measure unit qualifier"},
                      "desc" => "PRICE INFORMATION"
                    }
                  }
                },
              ],
              "RFF" => [
                # RFF+ON:JJTWZ:30'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "ON", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "JJTWZ", "desc" => "Reference number"},
                      "1156" => %{"val" => "30", "desc" => "Line number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
                # RFF+PL:V7'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "PL", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "V7", "desc" => "Reference number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
                # RFF+VN:8MEM5C9EUD:6'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "VN", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "8MeM5c9Eud", "desc" => "Reference number"},
                      "1156" => %{"val" => "6", "desc" => "Line number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
              ],
            },
            %{
              # LIN+7+5+0123456789012:EN'
              "LIN" => %{
                "1082" => %{"val" => "7", "desc" => "Line item number"},
                "1229" => %{"val" => "5", "desc" => "Action request/notification, coded", "qualifier_desc" => ""},
                "C212" => %{
                  "7140" => %{"val" => "0123456789012", "desc" => "Item number"},
                  "7143" => %{"val" => "EN", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                  "desc" => "ITEM NUMBER IDENTIFICATION"
                }
              },
              # PIA+1+V12345678:SA::91+0123456789012:IN::92'
              "PIA" => [
                %{
                  "4347" => %{"val" => "1", "desc" => "Product id. function qualifier", "qualifier_desc" => ""},
                  "C212" => [
                    %{
                      "7140" => %{"val" => "V12345678", "desc" => "Item number"},
                      "7143" => %{"val" => "SA", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                      "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                      "3055" => %{"val" => "91", "desc" => "Code list responsible agency, coded", "qualifier_desc" => ""},
                      "desc" => "ITEM NUMBER IDENTIFICATION"
                    },
                    %{
                      "7140" => %{"val" => "0123456789012", "desc" => "Item number"},
                      "7143" => %{"val" => "IN", "desc" => "Item number type, coded", "qualifier_desc" => ""},
                      "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                      "3055" => %{"val" => "92", "desc" => "Code list responsible agency, coded", "qualifier_desc" => ""},
                      "desc" => "ITEM NUMBER IDENTIFICATION"
                    }
                  ]
                }
              ],
              # IMD+F++:::Product seven'
              "IMD" => [
                %{
                  "7077" => %{"val" => "F", "desc" => "Item description type, coded", "qualifier_desc" => ""},
                  "7081" => %{"val" => "", "desc" => "Item characteristic, coded"},
                  "C273" => %{
                    "7009" => %{"val" => "", "desc" => "Item description identification"},
                    "1131" => %{"val" => "", "desc" => "Code list qualifier"},
                    "3055" => %{"val" => "", "desc" => "Code list responsible agency, coded"},
                    "7008" => [%{"val" => "Product seven", "desc" => "Item description"}],
                    "desc" => "ITEM DESCRIPTION"
                  }
                }
              ],
              "QTY" => [
                # QTY+21:2:PCE'
                %{
                  "C186" => %{
                    "6063" => %{"val" => "21", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "2", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
                # QTY+113:2:PCE'
                %{
                  "C186" => %{
                    "6063" => %{"val" => "113", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "2", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
                # QTY+47:2:PCE'
                %{
                  "C186" => %{
                    "6063" => %{"val" => "47", "desc" => "Quantity qualifier", "qualifier_desc" => ""},
                    "6060" => %{"val" => "2", "desc" => "Quantity"},
                    "6411" => %{"val" => "PCE", "desc" => "Measure unit qualifier"},
                    "desc" => "QUANTITY DETAILS"
                  }
                },
              ],
              "DTM" => [
                # DTM+2:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "2", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+64:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "64", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+69:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "69", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
                # DTM+85:20171002:102'
                %{
                  "C507" => %{
                    "2005" => %{"val" => "85", "desc" => "Date/time/period qualifier", "qualifier_desc" => ""},
                    "2380" => %{"val" => "20171002", "desc" => "Date/time/period"},
                    "2379" => %{"val" => "102", "desc" => "Date/time/period format qualifier", "qualifier_desc" => ""},
                    "desc" => "DATE/TIME/PERIOD"
                  }
                },
              ],
              # MOA+203:349.20'
              "MOA" => [
                %{
                  "C516" => %{
                    "5025" => %{"val" => "203", "desc" => "Monetary amount type qualifier", "qualifier_desc" => ""},
                    "5004" => %{"val" => "349.20", "desc" => "Monetary amount"},
                    "desc" => "MONETARY AMOUNT"
                  }
                }
              ],
              "PRI" => [
                # PRI+AAA:174.60::::STK'
                %{
                  "PRI" => %{
                    "C509" => %{
                      "5125" => %{"val" => "AAA", "desc" => "Price qualifier", "qualifier_desc" => ""},
                      "5118" => %{"val" => "174.60", "desc" => "Price"},
                      "5375" => %{"val" => "", "desc" => "Price type, coded"},
                      "5387" => %{"val" => "", "desc" => "Price type qualifier"},
                      "5284" => %{"val" => "", "desc" => "Unit price basis"},
                      "6411" => %{"val" => "STK", "desc" => "Measure unit qualifier"},
                      "desc" => "PRICE INFORMATION"
                    }
                  }
                },
                # PRI+AAB:194.00::::STK'
                %{
                  "PRI" => %{
                    "C509" => %{
                      "5125" => %{"val" => "AAB", "desc" => "Price qualifier", "qualifier_desc" => ""},
                      "5118" => %{"val" => "194.00", "desc" => "Price"},
                      "5375" => %{"val" => "", "desc" => "Price type, coded"},
                      "5387" => %{"val" => "", "desc" => "Price type qualifier"},
                      "5284" => %{"val" => "", "desc" => "Unit price basis"},
                      "6411" => %{"val" => "STK", "desc" => "Measure unit qualifier"},
                      "desc" => "PRICE INFORMATION"
                    }
                  }
                },
              ],
              "RFF" => [
                # RFF+ON:JJTWZ:35'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "ON", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "JJTWZ", "desc" => "Reference number"},
                      "1156" => %{"val" => "35", "desc" => "Line number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
                # RFF+PL:V7'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "PL", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "V7", "desc" => "Reference number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
                # RFF+VN:8MeM5c9Eud:7'
                %{
                  "RFF" => %{
                    "C506" => %{
                      "1153" => %{"val" => "VN", "desc" => "Reference qualifier", "qualifier_desc" => ""},
                      "1154" => %{"val" => "8MeM5c9Eud", "desc" => "Reference number"},
                      "1156" => %{"val" => "7", "desc" => "Line number"},
                      "desc" => "REFERENCE"
                    },
                  },
                },
              ],
            },
          ],
          # UNS+S'
          "UNS" => %{
            "0081" => %{"val" => "S", "desc" => "Section identification"}
          },
            # MOA+125:4429.80'
          "MOA" => [
            %{
              "C516" => %{
                "5025" => %{"val" => "125", "desc" => "Monetary amount type qualifier", "qualifier_desc" => ""},
                "5004" => %{"val" => "4429.80", "desc" => "Monetary amount"},
                "desc" => "MONETARY AMOUNT"
              }
            },
            # MOA+131:492.20'
            %{
              "C516" => %{
                "5025" => %{"val" => "131", "desc" => "Monetary amount type qualifier", "qualifier_desc" => ""},
                "5004" => %{"val" => "492.20", "desc" => "Monetary amount"},
                "desc" => "MONETARY AMOUNT"
              }
            },
            # MOA+176:1107.45'
            %{
              "C516" => %{
                "5025" => %{"val" => "176", "desc" => "Monetary amount type qualifier", "qualifier_desc" => ""},
                "5004" => %{"val" => "1107.45", "desc" => "Monetary amount"},
                "desc" => "MONETARY AMOUNT"
              }
            },
            # MOA+259:0.00'
            %{
              "C516" => %{
                "5025" => %{"val" => "259", "desc" => "Monetary amount type qualifier", "qualifier_desc" => ""},
                "5004" => %{"val" => "0.00", "desc" => "Monetary amount"},
                "desc" => "MONETARY AMOUNT"
              }
            },
            # MOA+260:492.20'
            %{
              "C516" => %{
                "5025" => %{"val" => "260", "desc" => "Monetary amount type qualifier", "qualifier_desc" => ""},
                "5004" => %{"val" => "492.20", "desc" => "Monetary amount"},
                "desc" => "MONETARY AMOUNT"
              }
            },
            # MOA+77:4922.00'
            %{
              "C516" => %{
                "5025" => %{"val" => "77", "desc" => "Monetary amount type qualifier", "qualifier_desc" => ""},
                "5004" => %{"val" => "4922.00", "desc" => "Monetary amount"},
                "desc" => "MONETARY AMOUNT"
              }
            },
            # MOA+79:4429.80'
            %{
              "C516" => %{
                "5025" => %{"val" => "79", "desc" => "Monetary amount type qualifier", "qualifier_desc" => ""},
                "5004" => %{"val" => "4429.80", "desc" => "Monetary amount"},
                "desc" => "MONETARY AMOUNT"
              }
            },
            # MOA+86:5537.25'
            %{
              "C516" => %{
                "5025" => %{"val" => "86", "desc" => "Monetary amount type qualifier", "qualifier_desc" => ""},
                "5004" => %{"val" => "5537.25", "desc" => "Monetary amount"},
                "desc" => "MONETARY AMOUNT"
              }
            },
          ],
          "CNT" => [
            # CNT+1:27.0'
            %{
              "C270" => %{
                "6069" => %{"val" => "1", "desc" => "Control qualifier", "qualifier_desc" => ""},
                "6066" => %{"val" => "27.0", "desc" => "Control value"},
                "desc" => "CONTROL"
              }
            },
            # CNT+2:7'
            %{
              "C270" => %{
                "6069" => %{"val" => "2", "desc" => "Control qualifier", "qualifier_desc" => ""},
                "6066" => %{"val" => "7", "desc" => "Control value"},
                "desc" => "CONTROL"
              }
            },
          ],
          # UNT+216+SGU8Gtp6jW'
          "UNT" => %{
            "0074" => %{"val" => "216", "desc" => "Number of segments in a message"},
            "0062" => %{"val" => "SGU8Gtp6jW", "desc" => "Message reference number"},
          }
        }
      ],
      # UNZ+1+1'
      "UNZ" => %{
        "0036" => %{"val" => "1", "desc" => "INTERCHANGE CONTROL COUNT"},
        "0020" => %{"val" => "1", "desc" => "NTERCHANGE CONTROL REFERENCE"},
      }
    }} == EdifactParser.parse(@ordrsp)
  end
end
