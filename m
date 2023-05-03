Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7B72D6F5596
	for <lists+linux-rtc@lfdr.de>; Wed,  3 May 2023 12:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229665AbjECKI1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 3 May 2023 06:08:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjECKI0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 3 May 2023 06:08:26 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2101.outbound.protection.outlook.com [40.107.114.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A20A01A5;
        Wed,  3 May 2023 03:08:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BxjY3nlNuUFdmjQVFxDLN8l57tL5kUGxfFTwxFs6tbFvkQkrrXNbSt47yGmHCudvFDgOb55PawPkEJuYl0pS5P2BVj0PndxGYF1yBUoNxuKVGwqJcFhcuVNkNPg3HRE1ZVJlz2h2KyHRxed0YE0Fy30T7HbkMOmU92gvcUstOEFw4YyIX3tUiVJF8a9fXx1j1VEZwY8x2MIP6fwp8dtZjTL7inb08+0TfMDyRmzXSc1r6PzVfpwpiwP7GzFLAptKc/82uJhoUxiRCwX3qLR15BY3qcY9c8lAqvWucp57VPH9WobK+dcyuwfJCbUc8TUdEZbGrB4PMlxGkK8sYzhKvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lVpO+oGhW6yPsXzsjh/CflprMvvNG3xsVm6yVBweygQ=;
 b=jtZdMs9a6YhNvqFD37GAwDQ0vQZl8YiO8ztPw0rzUKt8fjhvs7ZBwFMoLSJFWecvWRiAa5mXmDvzPcMedftu4e8OclYgl2m4mtMcS+FPqye57t++pzKT2+6Vdhh0D1fdIN7hTMyKJCOmZ2GTMJAyTzqGWdEXrjeiKmOL7EwanOfBWYPxzJG6Ig8ETeCXyer4PsDzhhpTbfHPedDT3cbeUhvjyggc/wQXy6kco/P90ZEPtbjRNV+O2ZusKtOtM18WeNmZpiz9xT9q1AdZTm/dVlnL8H74plci/QYVOco5u8+UHhKe46C9g5ss6cwpdjYaFtmWEh3rZex59KCZLe+e5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lVpO+oGhW6yPsXzsjh/CflprMvvNG3xsVm6yVBweygQ=;
 b=OrGjn048GQ8vI62u9EbX90QlPstEjOWHtbZ9h8n7OHfXyU0KzxoYBunqZl87XAmvibeYv07ZUb4m1SC3sPkvovoMT4Cucxg7kvV4eX9hmHD5lgPwyE1F7PHVR68sR5Bqay89yzY/cFG/U9U9PNbUQF7nBpTO14IBPSNEtQ8RPX8=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB9304.jpnprd01.prod.outlook.com (2603:1096:400:190::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21; Wed, 3 May
 2023 10:08:21 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6363.021; Wed, 3 May 2023
 10:08:21 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Trent Piepho <tpiepho@gmail.com>
Subject: RE: [PATCH RFC 4/6] dt-bindings: rtc: isl1208: Document built-in RTC
 device on PMIC RAA215300
Thread-Topic: [PATCH RFC 4/6] dt-bindings: rtc: isl1208: Document built-in RTC
 device on PMIC RAA215300
Thread-Index: AQHZfZvC9fb/fP1WtkWOaUSQWSRFO69ISjaAgAAENBA=
Date:   Wed, 3 May 2023 10:08:20 +0000
Message-ID: <OS0PR01MB5922FDA33F631ADD1B9962C3866C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230503084608.14008-1-biju.das.jz@bp.renesas.com>
 <20230503084608.14008-5-biju.das.jz@bp.renesas.com>
 <CAMuHMdVrH5R4mAjm1c9zRqiGhNsfT7Y13xxaV-v05T-MCJ6=RQ@mail.gmail.com>
In-Reply-To: <CAMuHMdVrH5R4mAjm1c9zRqiGhNsfT7Y13xxaV-v05T-MCJ6=RQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB9304:EE_
x-ms-office365-filtering-correlation-id: 941f5e80-cc76-4f00-7909-08db4bbe52f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NpRQVo3OO0PqKAr97Kak+XZRuG6Q23L8HCFjyvd09ZnuCY9rNu7FaAjsugsN9W9m2OenKo1ZRVLAY1Ox6H0qNk8lWeY+kEJwt5eOqNObWZwisFu/u76W/y5BA5gMVT6i/EbMDc57LhExRSHmNdNJgeIlBTLkLlIgZQp9zHHvVIPdHamws7ObtI3HFm/hCjEDmF7ADtwMZT6dBHfaYhfBsOnk9f9jDlXsyQRhWpGy66MaRJCGZGV2M/qRs2OpmJEYmZNKByFlcWTKDpG6vgWydacgJo5xL60o0pMco91Z4j8+mJfZ8w7Lyft9WEkNkSj1JdJiQSpCxu7e8w8IWGIotO4I6wKiFyEDZkQYLSKVTrvtJotUHkaMzSuQj38jwqTh2WcPMfkChcPVC3ZMXu9WqurNjHg+8CxJSD/D5i27p48CmUEx+vHVlJfH4haiLLlTUGeNde+Egu0wHtDkHqebQc81YJAjhTFAFVU0EfjNHGquLsnwPWpgBYaB4KVQR5JeqCFmeLVOA/+cae6RQai1U60gyyvaLi72L/xSodJBjMPen5xyHLJCcZuNu6UnyFWdm29UCDpRB+kCITryBo3BVqLbDMNrHUVNgySpDwQxjUJmew8JaIIyDePZZQkM+cP+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199021)(122000001)(38100700002)(2906002)(8936002)(7416002)(8676002)(52536014)(5660300002)(33656002)(86362001)(38070700005)(55016003)(71200400001)(7696005)(478600001)(54906003)(186003)(9686003)(6506007)(26005)(53546011)(83380400001)(41300700001)(66446008)(66556008)(66946007)(76116006)(64756008)(66476007)(4326008)(6916009)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2dmNGNwTm1oR2dVNXJJQ2o5cFZwR04rVVk3dkZ5SGVHVm9NTGt4eVY3RjR2?=
 =?utf-8?B?NGhnaTlCdnVsQTA4MUd5WlUrakFIalVmM0wzbnN3QlViK1FISkhHWjlVUDBp?=
 =?utf-8?B?bkY0UGViVE9LMVZXTVdLQzBWNkY3OHpJaUU1TTBKbEprLzF4SEdJT0p6UUl0?=
 =?utf-8?B?NUpNeHp4QXhIVzhrVzUrTk5SNnJ1TG43ODQzbFJlV1hvNEZFNFVMV1VTMjgv?=
 =?utf-8?B?L2hkODZrWDV5SElqcmlBdHROS1RXaHFPeUJxQ2xpMXgxdk5pYllMbk9FZU9h?=
 =?utf-8?B?dlFwNjNIcVJlaXVPdEJhaE1jbGRzc00wRlcwOFl4YlpqbFRzZTRpcUFkRHIv?=
 =?utf-8?B?R1Y1WlhXUUtDTlB2Zm5ZcERhNTFHZ0VGK0ZqWlJjVmZBNmdVZ1dZcmhndC9q?=
 =?utf-8?B?K29tZ1ZlaVBZeGVuTlQzOWR3K3Uyd3dqdkxhYnRxQnJMa3lyWnVlQU1QWVVa?=
 =?utf-8?B?dXhoYjF3cDViSlBtZ1RhcEpoWG1uSWk1RVhUN3ROZHcrNXIrSFNWVkRQQ2Qy?=
 =?utf-8?B?WlVkM1pCTDlBbUFsNDZBZ3ArQlU0bGNxNE5KbUFDZmtwcWsrdWZmU3BuVWJr?=
 =?utf-8?B?TXZQbSt2VXFsTEFyV1ZTRTJadXRKM3B5YytwU2dKQWZ6V0RvNVJ2eE0yQ2d0?=
 =?utf-8?B?NWlDcW9OZGlEZUxtSFkza1pQVUFYc1g4MkNaNnRVN3IyOGFSMWF2a0FKMEp4?=
 =?utf-8?B?bUt2U1Q4L1pMdXdmVTZPZnVaVmJ5QS9LellXYmJFU1BWSnhrK2tYM09VUnNi?=
 =?utf-8?B?RWNPKzlkRWI0WWpsVGFSK285ZnlnVjl1clBPcHhjYmpUelRTUzdRMzFRQ3dm?=
 =?utf-8?B?OEQ0aldSQUQzVDArdmRUNk41ZzI2eGMxWkwwaE9qNlN4VnhveStpQW9GOHc4?=
 =?utf-8?B?MEdTSjZkdmRNZlF1eGQzQXc5dmJ0d1Jneml6WVJYOXhkWFZ5YVR6aFZTN0ZD?=
 =?utf-8?B?c0ZrYUtIcmo1TldNeDRGTDFrYThUSkVqR1RwRUZLRDZJQ1YrZFRaRzRpZm92?=
 =?utf-8?B?UEExSTE2U0x3WjZ5NjFpZjdLSDFWdlRwRndtbVcwZ3d5VExKSEJMZnd0OVRE?=
 =?utf-8?B?QXJWZkowclRsdFdNT3Z1YVg2dU1Odlh2MmF6N0VsOC8wdGtkTGFSSk5nNEE5?=
 =?utf-8?B?OCtraXVPSVBLR0JvdHFxaWdKc2FiZGdLanBrUFZUVFBNVkFGRTVyNFZaa0ox?=
 =?utf-8?B?WElaS1hBZzRUWE9FdlhrbHRXOGEra2JMS1RieW96Y1JVdm9JNmlmL045OEFm?=
 =?utf-8?B?TExBcTM4WkdMRjV6bWw2SlhjR2NtQUZDSUVWTUVBK1FHSitjUFFwNlYxUzZB?=
 =?utf-8?B?d013RlNEbGJFV2pVUXRXcGQ3cXpSTHovWGlGaHRFYzZ2Wk9rYnZ2TForRHMw?=
 =?utf-8?B?TGM5NytaOFczVkUxWHFUNDQvaVlQdDB2U2wvT29RVURLN0JiSUpIaHAyMkRx?=
 =?utf-8?B?VStyQndlYjhmSDBsbzRtR0cxNVhEajZ1RlBvVkJjeTV2emFKZGYzdkRlQ09E?=
 =?utf-8?B?a0JCVnNTOTl5Z1AwNXFxOC9UNFVJNHB2czdzNUtzYVlBUGlydWlhTEJYcjh4?=
 =?utf-8?B?QzBRa1czdC9NWm9oRzNOUlAzNnY5cUU0dC9aNnZyYUwvbTdFdzZ3NlJEdGd2?=
 =?utf-8?B?SmJIMXMzNHJBZXQxeWlYWDkxN2wrMTNuL2dMK3ZmaVZTSWVRWUR2M0RxVHZi?=
 =?utf-8?B?d3dHWE01QnFDYkxSa0xPam5JUXB6RlRkN25YaUV4NWxNcmNQeEYxNVlRczhx?=
 =?utf-8?B?dDh2VnhhTG1nYVYwK0pnS1dDZzEwVVVNU2FFNWJwcExoNzN3bllib1NVZm5P?=
 =?utf-8?B?cm4yM2RoYnd0cUpFdE5Wa2UyZFdERC8xYkozcDdJMmtob1RkTEVzK2lwcGlM?=
 =?utf-8?B?NXNWaW1LMVBoT1J0cHE4VmdqTDd4V1Zic1hZTDBsMzRuNExLOXo2V3VGRU9C?=
 =?utf-8?B?QUJWMWdJa2dhc1FwRVlRUFNBVGtaZ0lJT0Z3Y25uZDJ2SWpxQkd1SEFOM2VZ?=
 =?utf-8?B?RmU0Q1dSbkdla0IreFE4QVJwS1hZV1F1clN1SWhUcGF1clpOclRHcmVjallL?=
 =?utf-8?B?eVpUMGdKN2pwK1BDUGx6eTJvdXQ3Mk1pUVYrci8xQ0NrenhQR3FKOW1WWjg1?=
 =?utf-8?Q?WSggLxP4Li8X2190tTy2qhkS4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 941f5e80-cc76-4f00-7909-08db4bbe52f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2023 10:08:21.0095
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Zszx06JwovAiuVb1C15vfp1oJNBMD9SV9Xv2Jyn+Qb4ho2ywUwVQ+ErSjFwyKfO80S0dVXjtMkQzOJTWIssqU2vpvc3jT5hMeSARd64eN0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9304
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggUkZDIDQvNl0gZHQtYmluZGluZ3M6IHJ0YzogaXNsMTIwODogRG9jdW1lbnQgYnVpbHQt
aW4NCj4gUlRDIGRldmljZSBvbiBQTUlDIFJBQTIxNTMwMA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+
IENDIFRyZW50J3MgbGF0ZXN0IGFkZHJlc3MNCg0KVGhhbmtzLCBJIHdpbGwgZml4IHRoaXMgaW4g
YmluZGluZ3MuDQoNCj4gDQo+IE9uIFdlZCwgTWF5IDMsIDIwMjMgYXQgMTA6NDbigK9BTSBCaWp1
IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFRoZSBCdWlsdC1p
biBSVEMgZGV2aWNlIGZvdW5kIG9uIFBNSUMgUkFBMjE1MzAwIGlzIHNpbWlsYXIgdG8gdGhlDQo+
ID4gaXNsMTIwOCBJUC4gSG93ZXZlciwgUlRDIGlzIGVuYWJsZWQgYnkgUE1JQyBSQUEyMTUzMDAg
YW5kIHRoZSBwb2xhcml0eQ0KPiA+IG9mIHRoZSBleHRlcm5hbCBvc2NpbGxhdG9yIGlzIGRldGVy
bWluZWQgYnkgdGhlIFBNSUMgcmV2aXNpb24uDQo+ID4NCj4gPiBEb2N1bWVudCByZW5lc2FzLHJh
YTIxNTMwMC1pc2wxMjA4IGNvbXBhdGlibGUgYW5kDQo+ID4gcmVuZXNhcyxyYWEyMTUzMDAtcG1p
YyBwcm9wZXJ0eSB0byBoYW5kbGUgdGhlc2UgZGlmZmVyZW5jZXMuDQo+ID4NCj4gPiBTaWduZWQt
b2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+
ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL3J0Yy9pc2lsLGlzbDEyMDgueWFtbCAgICAgICB8
IDEzICsrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cnRjL2lzaWwsaXNsMTIwOC55YW1sDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcnRjL2lzaWwsaXNsMTIwOC55YW1sDQo+ID4gaW5kZXggMDRkNTE4ODc4NTVmLi44ODhh
ODMyZWQxZGIgMTAwNjQ0DQo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3J0Yy9pc2lsLGlzbDEyMDgueWFtbA0KPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9ydGMvaXNpbCxpc2wxMjA4LnlhbWwNCj4gPiBAQCAtMTgsNiArMTgsNyBA
QCBwcm9wZXJ0aWVzOg0KPiA+ICAgICAgICAgICAgLSBpc2lsLGlzbDEyMDkNCj4gPiAgICAgICAg
ICAgIC0gaXNpbCxpc2wxMjE4DQo+ID4gICAgICAgICAgICAtIGlzaWwsaXNsMTIxOQ0KPiA+ICsg
ICAgICAgICAgLSByZW5lc2FzLHJhYTIxNTMwMC1pc2wxMjA4DQo+IA0KPiBUaGF0IHNvdW5kcyBh
IGJpdCBvdmVyLWNvbXBsaWNhdGVkLg0KPiBXaGF0IGFib3V0IGp1c3QgInJlbmVzYXMscmFhMjE1
MzAwLXJ0YyI/DQoNCk9LLCBnb29kIHRvIG1lLg0KDQo+IElmIHlvdSBjb25zaWRlciB0aGVtIHN1
ZmZpY2llbnRseSBjb21wYXRpYmxlLCB5b3UgY291bGQgYWRkICJpc2lsLGlzbDEyMDgiDQo+IGFz
IGEgZmFsbGJhY2suDQoNClRoZSBwbWljIGhhcyB0byBlbmFibGUgUlRDIGJsb2NrIHRvIG1ha2Ug
aXQgZnVuY3Rpb25hbC4NClRoZSByZWdpc3RlcnMgYW5kIGZ1bmN0aW9uYWxpdHkgYXJlIGNvbXBh
dGlibGUuDQpCdXQgdGhlIGNvbmZpZ3VyYXRpb24gb2YgT3NjaWxsYXRvciBwb2xhcml0eSBpcyBk
aWZmZXJlbnQgb24gUE1JQyB2ZXJzaW9uLg0KU28gd2UgbmVlZCB0byBoYW5kbGUgaXQgaGVyZS4g
DQoNCllvdSBtZWFuIGxpa2UgYmVsb3c/DQoNCisgICAgICAtIGl0ZW1zOg0KKyAgICAgICAgICAt
IGVudW06DQorICAgICAgICAgICAgICAtIHJlbmVzYXMsIHJhYTIxNTMwMC1ydGMNCisgICAgICAg
ICAgLSBjb25zdDogaXNpbCxpc2wxMjA4DQoNCj4gDQo+ID4NCj4gPiAgICByZWc6DQo+ID4gICAg
ICBtYXhJdGVtczogMQ0KPiA+IEBAIC00MCw2ICs0MSwxMCBAQCBwcm9wZXJ0aWVzOg0KPiA+ICAg
ICAgICAgIDwwPiA6IEVuYWJsZSBpbnRlcm5hbCBwdWxsLXVwDQo+ID4gICAgICAgICAgPDE+IDog
RGlzYWJsZSBpbnRlcm5hbCBwdWxsLXVwDQo+ID4NCj4gPiArICByZW5lc2FzLHJhYTIxNTMwMC1w
bWljOg0KPiANCj4gInJlbmVzYXMscG1pYyI/DQoNCk9LLiBBZ3JlZWQuDQoNCkNoZWVycywNCkJp
anUNCg0KPiANCj4gPiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25z
L3BoYW5kbGUNCj4gPiArICAgIGRlc2NyaXB0aW9uOiBwaGFuZGxlIHRvIHRoZSBwbWljIGRldmlj
ZSB3aXRoIGlzbDEyMDggYnVpbHQtaW4gUlRDLg0KPiA+ICsNCj4gPiAgcmVxdWlyZWQ6DQo+ID4g
ICAgLSBjb21wYXRpYmxlDQo+ID4gICAgLSByZWcNCj4gPiBAQCAtNTgsNiArNjMsMTQgQEAgYWxs
T2Y6DQo+ID4gICAgICAgICAgLSBpbnRlcnJ1cHRzLWV4dGVuZGVkDQo+ID4gICAgICAgICAgLSBp
bnRlcnJ1cHQtbmFtZXMNCj4gPiAgICAgICAgICAtIGlzaWwsZXYtZXZpZW5iDQo+ID4gKyAgLSBp
ZjoNCj4gPiArICAgICAgcHJvcGVydGllczoNCj4gPiArICAgICAgICBjb21wYXRpYmxlOg0KPiA+
ICsgICAgICAgICAgY29udGFpbnM6DQo+ID4gKyAgICAgICAgICAgIGNvbnN0OiByZW5lc2FzLHJh
YTIxNTMwMC1pc2wxMjA4DQo+ID4gKyAgICB0aGVuOg0KPiA+ICsgICAgICByZXF1aXJlZDoNCj4g
PiArICAgICAgICAtIHJlbmVzYXMscmFhMjE1MzAwLXBtaWMNCj4gPg0KPiA+ICB1bmV2YWx1YXRl
ZFByb3BlcnRpZXM6IGZhbHNlDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAg
ICAgICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4g
LS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LQ0KPiBt
NjhrLm9yZw0KPiANCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBw
ZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRv
IGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlDQo+
IHRoYXQuDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFs
ZHMNCg==
