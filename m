Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1C8E6F7F6F
	for <lists+linux-rtc@lfdr.de>; Fri,  5 May 2023 10:56:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231267AbjEEI4c (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 5 May 2023 04:56:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjEEI4b (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 5 May 2023 04:56:31 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2112.outbound.protection.outlook.com [40.107.113.112])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E3D316340;
        Fri,  5 May 2023 01:56:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VFexy2mS+Q9GNw/ggh3XVzbgK0h4bIJIlfj8h25PExcCBKCSw3aUdYDHL1Jtq9y82U4yMMUe0gPd0NTwVTlLoVa3r4O7lrwP1ouTXi9jAy6eqclxOzhc5xtaMH1UisepqbP7cxOCgE7DZRtKUB0yKlqckIrZUFsaaOgAv+1VQZiLIUDmNf9uHFkNc2NLPHM5xvhuli8EVts/YQ/UJYaaBiYkOXOt3YspgWi1YVb5un7WFt4Rlzqa/Tu5vaWupcxCNttxnuSWCvWuXXpnW3ya8QcyQZeVEeEcF5qxrAYBofNHRfmCiAAEai9xC7TUdppZ0bL3FZYjuqTWP18rsui4ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4oAETRI5ffnZ+2Yp8L1dwzxcXJfrU2okhzRyokleAM=;
 b=ZUzyxzUpb9thdYfMeu3IBMj90TztabyPzVkRTOy75klcMjJfohME9JmdHyMIFo2ViHkrgsR3uITOOwD2xTGBbOw83BJ4ZGInZ2qM/7YDzTvaC/E+w2VwdCXRkX5cWjy6vxLsFxFCY4YSwp/ZweyxZH3KPcBztfZPrP27VX82rH6UNdOSh8UFvXiOV83wriNgfgGZrVIyDk/ni6vLaQaYownQTD9ao6pMsGHUafxcLoFi78QkBK4jPUV1mia0egF3r3F9fsVd2Zdv69uTvJmTiMElj7txwl3jV5CRDWLBWQgwiZHR1vOmv9DN3P/agyZ27ulpO9Jgq+2bIlgKQQY1Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4oAETRI5ffnZ+2Yp8L1dwzxcXJfrU2okhzRyokleAM=;
 b=W4MLIMgh7FXx5bvwhMvEr2m84fR1A2WsTZoGM1Ud8xjwUJSNTYLTm0xjs0JJU4r2RIjfWo9XCF8ofZWLDdVisuzg//jElz7NHj/5L+qUUzBN5UhiIZDzZTiJppw8Vacp2zIYkITnOf8mJFaO3rUdI7/oecOo9/ZdbEAvoZDrZZY=
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com (2603:1096:400:47::11)
 by OS0PR01MB5649.jpnprd01.prod.outlook.com (2603:1096:604:be::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27; Fri, 5 May
 2023 08:56:24 +0000
Received: from TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::831b:77c4:7538:9f90]) by TYCPR01MB5933.jpnprd01.prod.outlook.com
 ([fe80::831b:77c4:7538:9f90%7]) with mapi id 15.20.6363.027; Fri, 5 May 2023
 08:56:24 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Trent Piepho <tpiepho@gmail.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2] dt-bindings: rtc: isl1208: Convert to json-schema
Thread-Topic: [PATCH v2] dt-bindings: rtc: isl1208: Convert to json-schema
Thread-Index: AQHZfyh/KgZQwbj2KUm4sEcJ7zwCTq9LVZgAgAAF4+A=
Date:   Fri, 5 May 2023 08:56:24 +0000
Message-ID: <TYCPR01MB5933F9A9907B40601705952D86729@TYCPR01MB5933.jpnprd01.prod.outlook.com>
References: <20230505080621.96646-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdVMtMhrPMqMS77t6dJLPCr+Uu2F-hQPybWijbFyz6KCCQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVMtMhrPMqMS77t6dJLPCr+Uu2F-hQPybWijbFyz6KCCQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB5933:EE_|OS0PR01MB5649:EE_
x-ms-office365-filtering-correlation-id: f5e99b98-2a1d-4e03-15c1-08db4d469af6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OcxUE2v+BwsCBOF+JXZ938LlSoYL2VLhLjVxa9pDmUJt0izKerO781L1wRZDqgvgqkY2s/52WtLB17+n4sUhOXHVFiYotgpdvmZ3ivk1kjn4TGV/i9X8MW1wyFdspKvGRQOrz1cUm7jBE7JW/jbLGYWFCs2oWpaDPfFsIfnWj0mT3mX29dpO1w7J5hWq1sgMmlt/hTqFERd5b7txV4buHu3oackI42e0lVDf+g60w0l3+ePdmDdthUsRohF0KShiAhIz//b/fLwejl54KKbSna4Frpj6CMHiZBKL70nFMz7r1uvfT/i1lSZpQ32EjlsO3dodA97IHUrN4I1v9Y7lZU+ywZNDezQYIRiSKTnx8SCNj5eSvg2Co+2tL5LFU81b8GYKP1M0Kb0AmLLXHB/g59CuiT3jPTRP/yyXycGvv5QRNkZouP/rpl6ye5m/x1FCGxwIfsCDBrNSyEZSpQ2l22f8BZbcpNHOr0hJ4Dvzyr4lp9VptQFFeaK9KCX0hSbURH5lt5WFcmFZwzCQ09NiLlNJTE2Ylrq8fQjXUfPBqFR3x22T30hqBbOrLL4jHTK/GD7y348lXGoKOpoC+0YquAzQCjqcUSW3Hzv0cftQFHFt7oJC3R7wmKR4hlL6bQ+Y
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5933.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199021)(86362001)(7696005)(76116006)(4326008)(66946007)(66476007)(64756008)(66446008)(6916009)(478600001)(71200400001)(66556008)(54906003)(316002)(33656002)(83380400001)(53546011)(6506007)(9686003)(26005)(8936002)(8676002)(5660300002)(52536014)(2906002)(41300700001)(55016003)(7416002)(38070700005)(186003)(122000001)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aWFOUndOMnEvSjZTQ1ROWlFQV05SRFpJL1Vub0lqQzhYcUJ1Z0wwcm1UalFh?=
 =?utf-8?B?R2ZxYkxWQTk2YUlYUVozTmpicENaUFFUNGcwNUR4bWgvZnlVanlNS0t1Vlkx?=
 =?utf-8?B?cU1GbDMxNHlQS3hHdlk4eHdiNktZa0Uzckh4K21kVjBlMWpjSmdJMEg4YmdO?=
 =?utf-8?B?UmdXdE9kNVR3aVZZSkdmcTkyZDAzL01nU0lzK05EN1UzKzBnVVlBTUI1YkVy?=
 =?utf-8?B?NmNSblRHSm4vaHpzcldjcTcvRlJ3VjJiVlF2ajFPWDVGbEx6Ny9rbkFDNTF3?=
 =?utf-8?B?Q3VBanZpYzdvMHMzVFJlS0xnSURhYUN3RmhMT0N3S2lhOTJxVWVuMUI5ZXZR?=
 =?utf-8?B?czBPZ3ZBOENodUFFR041dzA5T2hQRVllM25zUXUxamszKzBHSTJ3THhVaDRD?=
 =?utf-8?B?VjFrWDNVQW9SUWtRS1dwKzhTbHQxa0Y3aFE1cHZIREFCUXN2b1FEeUlDNTgz?=
 =?utf-8?B?VUdFekRDM0JwMllaLzNzd24vbysyQi9ZbFJVV0J3Sm8vTHVVcHFFdUtoeG5Q?=
 =?utf-8?B?OTBCWE9uZ2swbGt6MmU3ZmoyamFVOXlFL2thR3d0MFdzN0gyclErajJ6MkNi?=
 =?utf-8?B?c25kdkplMUUyOE9XL1k4Y3lkZnhWangycEdjQ1l2eFptLy9hVndqd0xiQXhv?=
 =?utf-8?B?MkwrSTVUS2xXems3WDNHT1RQendkZ1YrdUJubEk2Vlp4Ymg1Z2VGblE3TVB2?=
 =?utf-8?B?UVVQdjd6ZFQwZWtpdS95djgvREZHelV0azJoRml6VmNoWmJGR1lKWVkwOHRT?=
 =?utf-8?B?WnRUcDZzUHBERnplYnJHMkZlN1VTdnZWbnBBZnJCeEFEZEhkOWZ3emFFYVlr?=
 =?utf-8?B?dVZRVlhRV0VHOVlCQklLUm5lWk1FWVZsZzN5U250UHhtaG5CZ2s1TXlrNjBS?=
 =?utf-8?B?bVZkUXlLcGphV3M3ak1DeFYyNndnTEpIUk9aeWc0dk1rMnJYelppMHFnaDhq?=
 =?utf-8?B?aGh0MUVrbVpOMVN6M1hKVzJXL1EwRFIrRGRZdisyWUUrazhUQmZHaUpiWlJW?=
 =?utf-8?B?Vkgyakt5Sm9YMGRQVkdPcGdVR3Yrc3NNM3VGS0p0dWJLMGhGcklCVGhpcVAr?=
 =?utf-8?B?N2pZSXloVjJWTjN0cFhETC9PM0JHeHQxWW5HTGwwbEMyMmU0QlZRTEhPSTF2?=
 =?utf-8?B?anE5RTVwci9aTjByTmEyeDNxaUlrN1BUVDZKcFVrYWFPSzVib3JKeERGZEw4?=
 =?utf-8?B?c2c5VFBmVWRheEJJeUVVbkttamxDNG9hTmNZdlp4VnlBUytQblQ1dE9CM1A2?=
 =?utf-8?B?cC9Hd2dLU1pRZmc1MG8xYTBHMndMb2Izc2wwWE1VZFhlTGZuS3R5bHFKTGJJ?=
 =?utf-8?B?a29YbXRzZzNZWE1SSVIzd0J6QlAzZFF4eTdUcTN3QkJXZW5ENXBKNTFKSzZu?=
 =?utf-8?B?WndURWlLU21STzdGZ1RDM0svenB0Z1p5L2EzMzlGc21qMzVUMWlJZmUybGpX?=
 =?utf-8?B?ZEVyQTM0YWZaTlRNbUQwMWo2cHRSOWhlcDVjcDhJSkVsRitCeDZ0VGI1Sit6?=
 =?utf-8?B?eTJCQlYzdXhyU09ySTlKUlV3RUpvRDhiME5ibmRpQ2kya2JNV1JZck5yWTR3?=
 =?utf-8?B?Rm41d05vTEgxQ016ZDkxc0FmWnlPaVEybXYvRUpGdE5yYS9yZWZDTUxzNmVM?=
 =?utf-8?B?NWlCcWxBdXhDemxjRkpzNSs2U1VIeDZCaVBjU0dHWTdMbHRNUGFrY1VZZkpi?=
 =?utf-8?B?dWZocXhER0RWalhlcy83N2llZDdzalBuY25zV0djb2ljWG9mTXZGMENjdXU1?=
 =?utf-8?B?NXVsRVhjbUtVUW5xelVJd21mQ2ZNS2FrdG1ubTZuMHJnMWFQMTY4MUJmdXRE?=
 =?utf-8?B?aU40LytEYmNiaytHY3Rod1F6aktGeFREa1hsMXU1R2QrRzl4WDNoejd2SmJp?=
 =?utf-8?B?OWI0a1Z0aDR4ZUJQQkxuNkxHQ1gvNTYzeHlIdWpxUllzdDlTdkdGeTZpeXBX?=
 =?utf-8?B?Rm9JQWZtVVJlZEE0cTk2NFlBNkhuNzlXQk8wRmZnNTJGZzZQNGpWT0lnU2RS?=
 =?utf-8?B?cHJ4UXA3WGtPNFRqMTNKUng3KytOWkwyZ3F4VFJTcFZ3VEpJL243RWs4QzZV?=
 =?utf-8?B?K1B2ZXduQ29nbWlyU1d3SysyQjRFL0FhSk5YcHRMWUh0NnhhNjMrRkd0enM0?=
 =?utf-8?Q?LK32l5BELZW+7iK82g4Xp1TTn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5933.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5e99b98-2a1d-4e03-15c1-08db4d469af6
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 May 2023 08:56:24.5746
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0f9gtOzbDdMOEN4q73kXesxwjmmin65iIKt1frYw42ymVVzfRIkBA8UGEpFROYdZb0F4zQuW2ZJCMmDFxMHqbeCivI+uDcpUi1qAP459rpY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5649
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjJdIGR0LWJpbmRpbmdzOiBydGM6IGlzbDEyMDg6IENvbnZlcnQgdG8ganNvbi1zY2hl
bWENCj4gDQo+IEhpIEJpanUsDQo+IA0KPiBPbiBGcmksIE1heSA1LCAyMDIzIGF0IDEwOjA24oCv
QU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBDb252
ZXJ0IHRoZSBpc2wxMjA4IFJUQyBkZXZpY2UgdHJlZSBiaW5kaW5nIGRvY3VtZW50YXRpb24gdG8g
anNvbi1zY2hlbWEuDQo+ID4NCj4gPiBVcGRhdGUgdGhlIGV4YW1wbGUgdG8gbWF0Y2ggcmVhbGl0
eS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gPiAtLS0NCj4gPiBSRkMtPnYyOg0KPiA+ICAqIFVwZGF0ZWQgbWFpbnRhaW5l
cnMgbGlzdA0KPiA+ICAqIFVwZGF0ZWQgZGVzY3JpcHRpb24gZnJvbSBvcmlnaW5hbCBiaW5kaW5n
cw0KPiA+ICAqIHJlbW92ZWQgZGVmYXVsdCBmcm9tIGlzaWwsZXYtZXZpZW5iIHByb3BlcnRpZXMg
dG8gbWF0Y2ggd2l0aCB0aGUNCj4gb3JpZ2luYWwNCj4gPiAgICBiaW5kaW5ncy4NCj4gPiAgKiBB
ZGRlZCBjb25kaXRpb25hbCBjaGVjayBmb3IgaW50ZXJydXB0cy4NCj4gDQo+IFRoYW5rcyBmb3Ig
dGhlIHVwZGF0ZSENCj4gDQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3J0Yy9pc2lsLGlzbDEyMDgudHh0DQo+ID4gKysrIC9kZXYvbnVsbA0KPiA+IEBAIC0xLDM4
ICswLDAgQEANCj4gPiAtSW50ZXJzaWwgSVNMMTIwOS8xOSBJMkMgUlRDL0FsYXJtIGNoaXAgd2l0
aCBldmVudCBpbg0KPiA+IC0NCj4gPiAtSVNMMTJYOSBoYXZlIGFkZGl0aW9uYWwgcGlucyBFVklO
IGFuZCAjRVZERVQgZm9yIHRhbXBlciBkZXRlY3Rpb24sDQo+ID4gd2hpbGUgdGhlDQo+ID4gLUlT
TDEyMDggYW5kIElTTDEyMTggZG8gbm90LiAgVGhleSBhcmUgYWxsIHVzZSB0aGUgc2FtZSBkcml2
ZXIgd2l0aA0KPiA+IHRoZSBiaW5kaW5ncyAtZGVzY3JpYmVkIGhlcmUsIHdpdGggY2hpcCBzcGVj
aWZpYyBwcm9wZXJ0aWVzIGFzIG5vdGVkLg0KPiA+IC0NCj4gPiAtUmVxdWlyZWQgcHJvcGVydGll
cyBzdXBwb3J0ZWQgYnkgdGhlIGRldmljZToNCj4gPiAtIC0gImNvbXBhdGlibGUiOiBTaG91bGQg
YmUgb25lIG9mIHRoZSBmb2xsb3dpbmc6DQo+ID4gLSAgICAgICAgICAgICAgIC0gImlzaWwsaXNs
MTIwOCINCj4gPiAtICAgICAgICAgICAgICAgLSAiaXNpbCxpc2wxMjA5Ig0KPiA+IC0gICAgICAg
ICAgICAgICAtICJpc2lsLGlzbDEyMTgiDQo+ID4gLSAgICAgICAgICAgICAgIC0gImlzaWwsaXNs
MTIxOSINCj4gPiAtIC0gInJlZyI6IEkyQyBidXMgYWRkcmVzcyBvZiB0aGUgZGV2aWNlDQo+ID4g
LQ0KPiA+IC1PcHRpb25hbCBwcm9wZXJ0aWVzOg0KPiA+IC0gLSAiaW50ZXJydXB0LW5hbWVzIjog
bGlzdCB3aGljaCBtYXkgY29udGFpbnMgImlycSIgYW5kICJldmRldCINCj4gPiAtICAgICAgIGV2
ZGV0IGFwcGxpZXMgdG8gaXNsMTIwOSBhbmQgaXNsMTIxOSBvbmx5DQo+ID4gLSAtICJpbnRlcnJ1
cHRzIjogbGlzdCBvZiBpbnRlcnJ1cHRzIGZvciAiaXJxIiBhbmQgImV2ZGV0Ig0KPiA+IC0gICAg
ICAgZXZkZXQgYXBwbGllcyB0byBpc2wxMjA5IGFuZCBpc2wxMjE5IG9ubHkNCj4gPiAtIC0gImlz
aWwsZXYtZXZpZW5iIjogRW5hYmxlIG9yIGRpc2FibGUgaW50ZXJuYWwgcHVsbCBvbiBFVklOIHBp
bg0KPiA+IC0gICAgICAgQXBwbGllcyB0byBpc2wxMjA5IGFuZCBpc2wxMjE5IG9ubHkNCj4gPiAt
ICAgICAgIFBvc3NpYmxlIHZhbHVlcyBhcmUgMCBhbmQgMQ0KPiA+IC0gICAgICAgVmFsdWUgMCBl
bmFibGVzIGludGVybmFsIHB1bGwtdXAgb24gZXZpbiBwaW4sIDEgZGlzYWJsZXMgaXQuDQo+ID4g
LSAgICAgICBEZWZhdWx0IHdpbGwgbGVhdmUgdGhlIG5vbi12b2xhdGlsZSBjb25maWd1cmF0aW9u
IG9mIHRoZSBwdWxsdXANCj4gPiAtICAgICAgIGFzIGlzLg0KPiA+IC0NCj4gPiAtRXhhbXBsZSBp
c2wxMjE5IG5vZGUgd2l0aCAjSVJRIHBpbiBjb25uZWN0ZWQgdG8gU29DIGdwaW8xIHBpbjEyIGFu
ZA0KPiA+ICNFVkRFVCBwaW4gLWNvbm5lY3RlZCB0byBTb0MgZ3BpbzIgcGluIDI0IGFuZCBpbnRl
cm5hbCBwdWxsLXVwIGVuYWJsZWQgaW4NCj4gRVZJTiBwaW4uDQo+ID4gLQ0KPiA+IC0gICAgICAg
aXNsMTIxOTogcnRjQDY4IHsNCj4gPiAtICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJpc2ls
LGlzbDEyMTkiOw0KPiA+IC0gICAgICAgICAgICAgICByZWcgPSA8MHg2OD47DQo+ID4gLSAgICAg
ICAgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJpcnEiLCAiZXZkZXQiOw0KPiA+IC0gICAgICAg
ICAgICAgICBpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZncGlvMSAxMiBJUlFfVFlQRV9FREdFX0ZB
TExJTkc+LA0KPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIDwmZ3BpbzIgMjQgSVJRX1RZUEVf
RURHRV9GQUxMSU5HPjsNCj4gPiAtICAgICAgICAgICAgICAgaXNpbCxldi1ldmllbmIgPSA8MT47
DQo+ID4gLSAgICAgICB9Ow0KPiA+IC0NCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9pc2lsLGlzbDEyMDgueWFtbA0KPiA+IGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9pc2lsLGlzbDEyMDgueWFtbA0KPiA+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5jYTcyZjY0YTY1NWMNCj4g
PiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3J0Yy9pc2lsLGlzbDEyMDgueWFtbA0KPiA+IEBAIC0wLDAgKzEsODYgQEANCj4gPiArIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpICVZ
QU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlkOg0KPiA+ICsNCj4gPiArdGl0bGU6IEludGVyc2ls
IElTTDEyMDkvMTkgSTJDIFJUQy9BbGFybSBjaGlwIHdpdGggZXZlbnQgaW4NCj4gPiArDQo+ID4g
K21haW50YWluZXJzOg0KPiA+ICsgIC0gVHJlbnQgUGllcGhvIDx0cGllcGhvQGdtYWlsLmNvbT4N
Cj4gPiArDQo+ID4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4gKyAgSVNMMTJYOSBoYXZlIGFkZGl0aW9u
YWwgcGlucyBFVklOIGFuZCAjRVZERVQgZm9yIHRhbXBlciBkZXRlY3Rpb24sDQo+ID4gK3doaWxl
IHRoZQ0KPiA+ICsgIElTTDEyMDggYW5kIElTTDEyMTggZG8gbm90Lg0KPiA+ICsNCj4gPiArcHJv
cGVydGllczoNCj4gPiArICBjb21wYXRpYmxlOg0KPiA+ICsgICAgb25lT2Y6DQo+ID4gKyAgICAg
IC0gZW51bToNCj4gPiArICAgICAgICAgIC0gaXNpbCxpc2wxMjA4DQo+ID4gKyAgICAgICAgICAt
IGlzaWwsaXNsMTIwOQ0KPiA+ICsgICAgICAgICAgLSBpc2lsLGlzbDEyMTgNCj4gPiArICAgICAg
ICAgIC0gaXNpbCxpc2wxMjE5DQo+ID4gKw0KPiA+ICsgIHJlZzoNCj4gPiArICAgIG1heEl0ZW1z
OiAxDQo+ID4gKw0KPiA+ICsgIGludGVycnVwdHM6DQo+ID4gKyAgICBtaW5JdGVtczogMQ0KPiA+
ICsgICAgbWF4SXRlbXM6IDINCj4gPiArDQo+ID4gKyAgaW50ZXJydXB0LW5hbWVzOiB0cnVlDQo+
IA0KPiBQbGVhc2Uga2VlcCB0aGUgbGlzdCBvZiBuYW1lcyBoZXJlLg0KDQpPSy4NCg0KPiANCj4g
PiArDQo+ID4gKyAgaXNpbCxldi1ldmllbmI6DQo+ID4gKyAgICAkcmVmOiAvc2NoZW1hcy90eXBl
cy55YW1sIy9kZWZpbml0aW9ucy91aW50MzINCj4gPiArICAgIGVudW06IFsgMCwgMSBdDQo+ID4g
KyAgICBkZXNjcmlwdGlvbjogfA0KPiA+ICsgICAgICBFbmFibGUgb3IgZGlzYWJsZSBpbnRlcm5h
bCBwdWxsIG9uIEVWSU4gcGluDQo+ID4gKyAgICAgIERlZmF1bHQgd2lsbCBsZWF2ZSB0aGUgbm9u
LXZvbGF0aWxlIGNvbmZpZ3VyYXRpb24gb2YgdGhlIHB1bGx1cA0KPiA+ICsgICAgICBhcyBpcy4N
Cj4gPiArICAgICAgICA8MD4gOiBFbmFibGVzIGludGVybmFsIHB1bGwtdXAgb24gZXZpbiBwaW4N
Cj4gPiArICAgICAgICA8MT4gOiBEaXNhYmxlcyBpbnRlcm5hbCBwdWxsLXVwIG9uIGV2aW4gcGlu
DQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNvbXBhdGlibGUNCj4gPiArICAtIHJl
Zw0KPiA+ICsNCj4gPiArYWxsT2Y6DQo+ID4gKyAgLSAkcmVmOiBydGMueWFtbCMNCj4gPiArICAt
IGlmOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAgIGNvbXBhdGlibGU6DQo+
ID4gKyAgICAgICAgICBjb250YWluczoNCj4gPiArICAgICAgICAgICAgZW51bToNCj4gPiArICAg
ICAgICAgICAgICAtIGlzaWwsaXNsMTIwOQ0KPiA+ICsgICAgICAgICAgICAgIC0gaXNpbCxpc2wx
MjE5DQo+ID4gKyAgICB0aGVuOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsgICAgICAg
IGludGVycnVwdHM6DQo+ID4gKyAgICAgICAgICBtYXhJdGVtczogMg0KPiA+ICsgICAgICAgIGlu
dGVycnVwdC1uYW1lczoNCj4gPiArICAgICAgICAgIGl0ZW1zOg0KPiA+ICsgICAgICAgICAgICAt
IGNvbnN0OiBpcnENCj4gPiArICAgICAgICAgICAgLSBjb25zdDogZXZkZXQNCj4gPiArICAgICAg
cmVxdWlyZWQ6DQo+ID4gKyAgICAgICAgLSBpbnRlcnJ1cHRzDQo+ID4gKyAgICAgICAgLSBpbnRl
cnJ1cHQtbmFtZXMNCj4gDQo+IEludGVycnVwdHMgYXJlIG5vdCByZXF1aXJlZCAobWF5IG5vdCBi
ZSB3aXJlZCksIGFuZCBhcmUgY29uc2lkZXJlZCBvcHRpb25hbA0KPiBieSB0aGUgZHJpdmVyLCB0
b28uDQoNCk9LLCB3aWxsIHJlbW92ZS4NCg0KPiANCj4gPiArICAgICAgICAtIGlzaWwsZXYtZXZp
ZW5iDQo+IA0KPiBBbHNvIG5vdCByZXF1aXJlZCwgYXMgcGVyIHRoZSBkZWZhdWx0IChsZWF2ZSBh
cy1pcykuDQoNCkFncmVlZC4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IA0KPiA+ICsgICAgZWxzZToN
Cj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBpbnRlcnJ1cHRzOg0KPiA+ICsg
ICAgICAgICAgbWF4SXRlbXM6IDENCj4gDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZl
biAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtDQo+
IG02OGsub3JnDQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcg
dG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UN
Cj4gdGhhdC4NCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2
YWxkcw0K
