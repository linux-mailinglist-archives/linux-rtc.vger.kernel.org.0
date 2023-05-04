Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7DA66F6F93
	for <lists+linux-rtc@lfdr.de>; Thu,  4 May 2023 18:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbjEDQJC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 4 May 2023 12:09:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230413AbjEDQJB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 4 May 2023 12:09:01 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2117.outbound.protection.outlook.com [40.107.113.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E1594C24;
        Thu,  4 May 2023 09:08:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFXBqyqbaaOQCWeeELOb7CYq2nLH90UDLA+0sfvI4kGMkidb13mJmOpV9gPBU/LaLX5Tmt/kqzzAxoU3OLDKABNmPHmIF9ukdbH+SXr5PXf+l3ggqXRd+O1dRFPZsqFLA9zDWuzC26LaLdm9jSu1rueSCQykVLaAZs3PL/V2m16iqhqe7d63CLoGdLR+NYLT7fzd39SX2RMVr+22ZrRmsLY/+5bqr5lEdOkEa7SUr9yy9/dpxjhEEIFmsaSbQxbQ/2JOZbJERZIwFodpDVltg4ADg41b3sSlGnmeoeszmvU7SCFaY+d66OffGxrfE9LGjiwHsEZ1J4U9WWLPBaaksQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aHbduWM+Xn3Bc0OcxHPo3RCAKF+MDnb0pfuXUYBzcU=;
 b=nCce3pax2mBwRJ1hWLme27VHoIwX9DnBt4dgqQ/O3nYGR+55wZGWiyVpOebNdVUCv15+S2R8+1Xfk+lBOpMk+kkl1h5QY/y9gDgURcyZYXPJxNFoXA2pnpuyasMXPjLFDdvtJYrTwLu1UEq2oiwtoDFJGw0JhKqubEQDjFm9X4XDebz3bqy4ZAtvNTHLLcgJk1k3DGDOYh/GZidUH6wUCIH/fOWFQ44ILXRA/flXm/sbEbzYBmvn+/WxBBlE2IiFQP8/KmLduUwpNUe4pK46Amhwocs1Ki3Z74s9EupvtKofM6FUHgx/QwSbiDwbSP3RKVWIZswOmu793Ht4ooow5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aHbduWM+Xn3Bc0OcxHPo3RCAKF+MDnb0pfuXUYBzcU=;
 b=fG/TbxY42YjoqO3Mn//Ki4SuZhFcFf/m24ykNWEImwkseZ5Dy7BfOurnraefSO/5N3mEvn6t5IVGTRsTSXIlR1ByEjMjo+hKm08HBN+AIkuZXvafhJcUCvLJ2cBA3TA2LjWSOBXVuaQ03abO64DUd/wx78JUh9YaFIz3jAhkRM4=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYYPR01MB10467.jpnprd01.prod.outlook.com (2603:1096:400:2f4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 16:08:55 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6363.026; Thu, 4 May 2023
 16:08:54 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Trent Piepho <tpiepho@impinj.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: RE: [PATCH RFC 4/6] dt-bindings: rtc: isl1208: Document built-in RTC
 device on PMIC RAA215300
Thread-Topic: [PATCH RFC 4/6] dt-bindings: rtc: isl1208: Document built-in RTC
 device on PMIC RAA215300
Thread-Index: AQHZfZvC9fb/fP1WtkWOaUSQWSRFO69Js+4AgAAKR4CAAAZdgIAAhJ5g
Date:   Thu, 4 May 2023 16:08:54 +0000
Message-ID: <OS0PR01MB5922582611BDFA9F2DF012A2866D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-5-biju.das.jz@bp.renesas.com>
 <db7ae5f9-393a-b892-dd6f-08c4f25ce7a8@linaro.org>
 <CAMuHMdVMsdvwq3t50ifKuCJ6LvPUcDjSu14tkdrSquizA=TsTw@mail.gmail.com>
 <47f5498d-2c7c-7e27-c93d-a2787e720b42@linaro.org>
In-Reply-To: <47f5498d-2c7c-7e27-c93d-a2787e720b42@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYYPR01MB10467:EE_
x-ms-office365-filtering-correlation-id: dcc4c4de-c335-4405-5a59-08db4cb9dbc3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ez44kDG7nbwzoxTr17diN8jPVKzqQ1s30X837SyulZEToTd+wC/ZBJ4CdQ4CTDXA+6Oi3Xch1RoaHItNXW0UOGcu/xg1a5mVR+H3SXnpiQxuwGHfzmFrFArayQJSe3B3wftbWKi/e75Jh32sh0pnBmvHUd9kcyOheT5f28/353wNIfn//CmEkatxNmjC7ySh/aOdRkO15Bmo9yqGLiVc/C/XXWS+1fUzDAmi5Yr8RL/EokyamxjEpaBCiukKX8M/uffbWQxz52PsN4t+jEO7dnAjkU6A2h4CsFR0ZFVmUahF3IB0CdsHfks0H5W31tSNjSiY+yL5kWCyPZl0fz85MXA4gwzQs8fBt6DpdSeJN3NgeOHXaq24fy7wpsxOqSsL3jnkW/D1t/nhfsoyhIaXtZegSxrbkAycC4+vB3TjFFnLeL+ltbSYkPAkcKT8ZLNVxypYKphIqRAYVlrXIHk4fRD0q+irH0S0c6hceE8i7Red6vF19yoVO4QNeF7SkjRvOkNRkOengLA7OJFycaw2+T+7CyVjp6MGkarmEp7pgtWYAo9+6EElehpkg1Q+9yOTFopTo8DlksI/l7g0oLvd16jVy+p0peBCnmUY1YUMdL2eLsPgK2doMNKRRCiIZGQ/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199021)(38100700002)(33656002)(316002)(71200400001)(41300700001)(6506007)(2906002)(53546011)(186003)(26005)(9686003)(110136005)(86362001)(54906003)(107886003)(66446008)(4326008)(7696005)(64756008)(66476007)(66556008)(76116006)(66946007)(38070700005)(55016003)(7416002)(52536014)(8936002)(5660300002)(8676002)(478600001)(122000001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M2UzbThFZGlPUVlRM1hnNUxtVENhWmpIRVRleWpZaCt5TTkvNzBEcHBrdXl6?=
 =?utf-8?B?MkNTYTVhUlh5RkFlUWkvZUJDdm1pRnk2TFhQT0h5TzdRLy9mMnhodXE2NDRo?=
 =?utf-8?B?bThHbjJIMTlrMUt3S1hWaWFpaHVvQ2x2MmpLamVOZkNBY0N3RGVxVy9sK2pn?=
 =?utf-8?B?QnlHaDRHRTRuZGRmemVQaUFuaGQxcjZHOUlod1F0dHh5dktmWkRtTUpjQ2VD?=
 =?utf-8?B?OUlLb2xlczQ1WmhyQVN4b0p3Qzd1ajlPRVFVR0lpbm1YdG1RNzJXK1kyaVV6?=
 =?utf-8?B?dm1qTmUydHJmcDYwTWw0ZFJ3TEZydlZyMDNxZVZxR2JXME5zSkRuOUw3YUhq?=
 =?utf-8?B?Z0pXYkRwQks4NU1TS3RNV3lTWFVFalhHRDFuNVdBa0MvYnNtSkEzeG1KSmVa?=
 =?utf-8?B?RXJ0RnVpMDZ6QXM1dEpJcExrd2FBREJCUUdyeEtaZDJzeGFtM0IzT0JQSE5X?=
 =?utf-8?B?aWRleGpyY3JwQzFBWDAzRGQ5ZmJvVHNBaDZoR1I4dnBiNDZ6cW4yQkJIb0Vj?=
 =?utf-8?B?ZC8rVTZ5ZUJYb3pOa1lzOGJNNGNTdjQvMkV0SkEzZGUvUHVMSDFJWlFqQUtp?=
 =?utf-8?B?aEhOZ1d6YXQ0bmIwQU1QbnRuVXlmTHdDdzU1OWlpeHZYZkRvcVJ1SHQ3NkFx?=
 =?utf-8?B?TjhUR3NsM0tyYSthTDR5dktpaEdpQ2paKzd6M3Zocmw1eVlkQjNXSEhWWCs3?=
 =?utf-8?B?UGMxamlqK2JQbU1YemI0SjA1VS9QdDFLZWJNcERZWlhmajYyb0RUWVNYSm9u?=
 =?utf-8?B?dTh3VG95dVUyVjNwMFFLellHdTRBRUhMQ0JKQXhxUExpZ1M3bnhsN2d4dEx3?=
 =?utf-8?B?aW04VGRsVEN5azBYWTY1emVXR1cvOWJKZGF6c3ZLdDBmV0tIV0M2YlhtcWhC?=
 =?utf-8?B?VWZZaVU0eFZhMThwRXhJdVRORjhENjRZblRqQTR0b1haZ0ZXc0tIRTdVYmpI?=
 =?utf-8?B?ZC9SaFBtTWxFeVlBSFNmRmtseDZUaFROM0RMbWhXSG4wSGZxenhRSjRQVTVO?=
 =?utf-8?B?YUZCK3FYMFd6a1VSajU0dnM0THFmYWpOSldaajNzaEVvbjVITU5CTTVEdENv?=
 =?utf-8?B?cXZPL2J6dnhMVlN3NFJGbUI3dlpyKzcyeWI5Q2JzQ1NuSGdjV3hsRnhUanlO?=
 =?utf-8?B?dTY4bzZ0VGNPdE5DWEEvbEp5d1RKdkNGR2lGcVRhdnZrRHZ3U1RPRTkvWWRj?=
 =?utf-8?B?ZmEzMTArVHQ1ZDBFRVB1ZFpBNXpLSmJBdW9zRDdvK3Z1aUw4WUp4cGNicENC?=
 =?utf-8?B?VzQxTnQyaWliQ282N0greWUyd09zTmlhVms1WkRPNXE1bHhiVnluWmQrT1Nu?=
 =?utf-8?B?TlljZm1WNFBFNDU1QnVCZHY2QmhEUjlqRGRsVllPNDF5eWYzY1lBeGZBTC9y?=
 =?utf-8?B?Sk9XQWVFbmtmM1p0S2RBbVpaTkJveGJrSHlNOGovM1orNFVWY2l5OFVLdG5j?=
 =?utf-8?B?UXZrTkhsRXFibFlQdmNtUlRMeGtTektTT0I0QjFwZ3ZxUDRldkd0TlIyMHVL?=
 =?utf-8?B?QkJ2cHJraWsrRVFTdXBZb1RoY0lQSWtoUzZOVlJuSjg0VFNMYkVnd3pjOGZR?=
 =?utf-8?B?dEo5djFZS1pYRWFSakpTcVFRVTFzVmk5blJ2b3VZOUtBY2dUSkNsUDNHVFFZ?=
 =?utf-8?B?R2huMHY5dDVydysrYzQvaHdRaXplRUtKaVNaZFk1YTMvMnpyWVlVR1lETGlV?=
 =?utf-8?B?NzFBaEx0ZkNvTDBXaEVtcmozVnFMV0NTaDRXZ2V0K2dFVWRaa0ZmYmFvbE1N?=
 =?utf-8?B?MSs1bEw0WUl0UlZJWHNJZ0NHZDFuaEl1ak5rR3lCSmFhenVTU2E2WURFVEE1?=
 =?utf-8?B?L3pzQTF5YkRxYmtsRjhxQUtqenF6RGhseE5YYmxUcjF6cjRaYkJodjFGZ091?=
 =?utf-8?B?ZkhETlRpcFRTR1hIVFJsQ0swMHBrUDdXSGlySXE2UW9mQnJrVlJuaGdWYUw0?=
 =?utf-8?B?akN4MmtQR0NVWmFJTlF4L0lPc05maVBkclgrcHFqaCtHUlRoa0lYWmRnU2VY?=
 =?utf-8?B?alJIRTVSVmNDeDlFU3V3TmxRSkZhRFBubVVmUnlaVE5vcGNiRXJzMHBiK28x?=
 =?utf-8?B?WjhZSlY5cjdIZVdGb0E0OTBFUHNlZDRXY2srKy9ENEZ4TlZNVm92SHBBS2dK?=
 =?utf-8?Q?p2fUApvqtNw4oKVov7gZWdxs0?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcc4c4de-c335-4405-5a59-08db4cb9dbc3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 May 2023 16:08:54.2535
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X6+eOpBFF/T6eNPGOX25FFJ3v+VFvYiPhaPe3zydLCnjjGOI8sDtxqzh9KelWhK0U3P8D1GxfE9Cw/YdlUF4z346h4U0ATW7sOFCjvL15Do=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10467
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgS3J5c3RvZmYsDQoNCj4gU3ViamVjdDogUmU6IFtQQVRDSCBSRkMgNC82XSBkdC1iaW5kaW5n
czogcnRjOiBpc2wxMjA4OiBEb2N1bWVudCBidWlsdC1pbg0KPiBSVEMgZGV2aWNlIG9uIFBNSUMg
UkFBMjE1MzAwDQo+IA0KPiBPbiAwNC8wNS8yMDIzIDA5OjQ3LCBHZWVydCBVeXR0ZXJob2V2ZW4g
d3JvdGU6DQo+ID4gSGkgS3J6eXN6dG9mLA0KPiA+DQo+ID4gT24gVGh1LCBNYXkgNCwgMjAyMyBh
dCA5OjEx4oCvQU0gS3J6eXN6dG9mIEtvemxvd3NraQ0KPiA+IDxrcnp5c3p0b2Yua296bG93c2tp
QGxpbmFyby5vcmc+IHdyb3RlOg0KPiA+PiBPbiAwMy8wNS8yMDIzIDEwOjQ2LCBCaWp1IERhcyB3
cm90ZToNCj4gPj4+IFRoZSBCdWlsdC1pbiBSVEMgZGV2aWNlIGZvdW5kIG9uIFBNSUMgUkFBMjE1
MzAwIGlzIHNpbWlsYXIgdG8gdGhlDQo+ID4+PiBpc2wxMjA4IElQLiBIb3dldmVyLCBSVEMgaXMg
ZW5hYmxlZCBieSBQTUlDIFJBQTIxNTMwMCBhbmQgdGhlDQo+ID4+PiBwb2xhcml0eSBvZiB0aGUg
ZXh0ZXJuYWwgb3NjaWxsYXRvciBpcyBkZXRlcm1pbmVkIGJ5IHRoZSBQTUlDIHJldmlzaW9uLg0K
PiA+Pj4NCj4gPj4+IERvY3VtZW50IHJlbmVzYXMscmFhMjE1MzAwLWlzbDEyMDggY29tcGF0aWJs
ZSBhbmQNCj4gPj4+IHJlbmVzYXMscmFhMjE1MzAwLXBtaWMgcHJvcGVydHkgdG8gaGFuZGxlIHRo
ZXNlIGRpZmZlcmVuY2VzLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPj4+IC0tLQ0KPiA+Pj4gIC4uLi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3J0Yy9pc2lsLGlzbDEyMDgueWFtbCAgICAgICB8IDEzICsrKysrKysrKysr
KysNCj4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQ0KPiA+Pj4NCj4gPj4+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL2lzaWws
aXNsMTIwOC55YW1sDQo+ID4+PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
dGMvaXNpbCxpc2wxMjA4LnlhbWwNCj4gPj4+IGluZGV4IDA0ZDUxODg3ODU1Zi4uODg4YTgzMmVk
MWRiIDEwMDY0NA0KPiA+Pj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3J0Yy9pc2lsLGlzbDEyMDgueWFtbA0KPiA+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3J0Yy9pc2lsLGlzbDEyMDgueWFtbA0KPiA+Pj4gQEAgLTE4LDYgKzE4LDcg
QEAgcHJvcGVydGllczoNCj4gPj4+ICAgICAgICAgICAgLSBpc2lsLGlzbDEyMDkNCj4gPj4+ICAg
ICAgICAgICAgLSBpc2lsLGlzbDEyMTgNCj4gPj4+ICAgICAgICAgICAgLSBpc2lsLGlzbDEyMTkN
Cj4gPj4+ICsgICAgICAgICAgLSByZW5lc2FzLHJhYTIxNTMwMC1pc2wxMjA4DQo+ID4+Pg0KPiA+
Pj4gICAgcmVnOg0KPiA+Pj4gICAgICBtYXhJdGVtczogMQ0KPiA+Pj4gQEAgLTQwLDYgKzQxLDEw
IEBAIHByb3BlcnRpZXM6DQo+ID4+PiAgICAgICAgICA8MD4gOiBFbmFibGUgaW50ZXJuYWwgcHVs
bC11cA0KPiA+Pj4gICAgICAgICAgPDE+IDogRGlzYWJsZSBpbnRlcm5hbCBwdWxsLXVwDQo+ID4+
Pg0KPiA+Pj4gKyAgcmVuZXNhcyxyYWEyMTUzMDAtcG1pYzoNCj4gPj4+ICsgICAgJHJlZjogL3Nj
aGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZQ0KPiA+Pj4gKyAgICBkZXNjcmlw
dGlvbjogcGhhbmRsZSB0byB0aGUgcG1pYyBkZXZpY2Ugd2l0aCBpc2wxMjA4IGJ1aWx0LWluIFJU
Qy4NCj4gPj4NCj4gPj4gTm8uIFlvdSBkb24ndCBuZWVkIGNyb3NzLWxpbmtpbmcuIFdlIGRvIG5v
dCByZXByZXNlbnQgb25lIGRldmljZSBhcw0KPiA+PiB0d28gYW5kIHRoZW4gZml4IHRoaXMgYnkg
Y3Jvc3MtbGlua2luZyB0aGVtLiBUaGUgZXhpc3RpbmcgYmluZGluZw0KPiA+PiBkb2VzIG5vdCBo
YXZlIGl0LCBzbyBpdCBzaG91bGQgYmUgYSBoaW50IGZvciB5b3UuDQo+ID4NCj4gPiBNYWtlcyBz
ZW5zZS4NCj4gPiBTbyB0aGVyZSBzaG91bGQgYmUgYSBzaW5nbGUgZGV2aWNlIG5vZGUgd2l0aCAy
IHJlZyBjZWxscywgYW5kIGENCj4gPiAicmVuZXNhcyxyYWEyMTUzMDAiIGNvbXBhdGlibGUgdmFs
dWUuDQo+IA0KPiBZZXMuDQo+IA0KPiA+DQo+ID4gT24gdGhlIExpbnV4IHNpZGUsIHRoZSAicmVu
ZXNhcyxyYWEyMTUzMDAiIE1GRCBkcml2ZXIgY2FuIGluc3RhbnRpYXRlDQo+ID4gYSBQTUlDIGFu
ZCBhbiBSVEMgY2VsbCwgdGhlIGxhdHRlciBzZXJ2ZWQgYnkgdGhlIChlbmhhbmNlZCkgZXhpc3Rp
bmcNCj4gPiBydGMtaXNsMTIwOCBkcml2ZXIuDQo+IA0KPiBSaWdodC4NCg0KV2UgY2Fubm90IHVz
ZSBNRkQgZHJpdmVyIHRvIGluc3RhbnRpYXRlIFJUQyBhcyBpdCBpcyBub3QgcGxhdGZvcm0gZGV2
aWNlLg0KDQpUaGFua3MgdG8gR2VlcnQgZm9yIHBvaW50aW5nIG91dCAiaTJjX25ld19hbmNpbGxh
cnlfZGV2aWNlIi4NCg0KV2l0aCB0aGlzLCB3ZSBjYW4gcmVnaXN0ZXIgcnRjIGRldmljZSBmcm9t
IHBtaWMgZHJpdmVyDQpVc2luZyB0aGUgYXBpICJyYWEyMTUzMDBfcnRjX3Byb2JlKHN0cnVjdCBp
MmNfY2xpZW50ICpjbGllbnQsIHVuc2lnbmVkIGludCBwbWljX3ZlcnNpb24pIi4NCg0KQ2hlZXJz
LA0KQmlqdQ0KDQoNCg0K
