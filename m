Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1B1572258A
	for <lists+linux-rtc@lfdr.de>; Mon,  5 Jun 2023 14:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233375AbjFEMXK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 5 Jun 2023 08:23:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233378AbjFEMW4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 5 Jun 2023 08:22:56 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2128.outbound.protection.outlook.com [40.107.113.128])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C131CA1;
        Mon,  5 Jun 2023 05:22:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DlgRny5V/BszWSrGI7a2fRPzWzl1AmDsfYIhnJ/XvHJjFKLrvNMevpbxaBHNIYAJ6CFtO5M+d8SwrU0U2MnmjDMrwrS1qbf80Iif7UPuL0hcW6SD9Ayu6BkGu7/72rNTWTM/f/HdYl2JTsUTVXUF8mlsuUG1V6M9290u9WFFXJW/tp2EkZM+mLLusZpSVKIusRlsMtL6j/P5r7NAJX7ju385xRoBClVQo/Z3p8rrkH0hzX7mbCKqUjPlkEcU69OjhP2YWbk/Cr0YI7cQs2aoH+p0cejMzvQ3C80LjO4+WQuSPCvzR+pOrr9NspugkqYxe8vj03vgZmttiDom6lY2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nRxVppWJJfR44ax9d0e8f/CNv1HJThQSiXxpgpOB0As=;
 b=E2ltlmd96riZL6HwMYYNdcGOhfmpekBx754IzWpAgno3eh4yaoLh9afrp5Z+7h7voX8Q2MFBhEImTpHpts9YBODm4ym3swcrU+8iA7AM833WZiqn+aATCbMcfSK22hfXr9HreUCJpwcu/p7oK1DVlDmTFsecvXBZSE7LkE2WxJ1XG6LF1UMJmqnmriaC1Q5fk2feGFVMgaWSNYm2dmT9hdpBspm8CLBkmWeFy+u5dCBWLNe5WP+TQav1QjXtXWvT9MEAbMzcs+sY/kkO1Wm0QEEv6c6uFPNX/lK4FmuWB6h7+EJPCzyc2i0w4F5AWELrFx/mHK+XQRFikMpUcXg6bQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nRxVppWJJfR44ax9d0e8f/CNv1HJThQSiXxpgpOB0As=;
 b=kGFmJUA322UlvE6Pl7PkUxeH+2d7WpePngLjRD2OXitYIpFFyBqHQ6F7az6WxYYaZr6Lvsms5G+gR0cGL7dvJuzb/np5BKzmNQP+ZBfMugrwZp+pFBOKmpcpxph8e9YBRdLRqBbwcHWGwjZRUBWmkFpWosKVsyShfQuCu1tm4WI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYWPR01MB8639.jpnprd01.prod.outlook.com (2603:1096:400:13c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.28; Mon, 5 Jun
 2023 12:22:38 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 12:22:38 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v6 11/11] rtc: isl1208: Add support for the built-in RTC
 on the PMIC RAA215300
Thread-Topic: [PATCH v6 11/11] rtc: isl1208: Add support for the built-in RTC
 on the PMIC RAA215300
Thread-Index: AQHZlV4Ncd6cOW3BO0uVIjKb4XLibK98Ht4AgAAG9CA=
Date:   Mon, 5 Jun 2023 12:22:38 +0000
Message-ID: <OS0PR01MB5922DAC377266672ADA9FC28864DA@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230602142426.438375-1-biju.das.jz@bp.renesas.com>
 <20230602142426.438375-12-biju.das.jz@bp.renesas.com>
 <CAMuHMdW=HFjTPRYfSqdnXF1Rpso241KUYMOH12wYatuto50RVg@mail.gmail.com>
In-Reply-To: <CAMuHMdW=HFjTPRYfSqdnXF1Rpso241KUYMOH12wYatuto50RVg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYWPR01MB8639:EE_
x-ms-office365-filtering-correlation-id: 98d6be1b-0eaa-4319-be3b-08db65bf8d69
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qwIuVPUWGZjFOh2zbYsMDbijviTobroRlaVn32pS/NCvaE0TVD4NJQRxQUXPuYfwoGDRkJAbJwkIt4EDkmZh3JvDOOvYJeAPJlqfrUjBdYKM0nia/EkCK6PkyviYByonCdy9L9OUl8o8Qswqd6GC6OGbSDLcOu8Vo/bPyKRR4wbbjYMfpdEFOlFeavKAfr093sQyZGjQTfeclPUgRqvN41bMFBbtd79PFGvv6IYuAJsqiRhPyTaY/ysn/gjZyp+bH1UeLpXc/ia67SdsN0xyl0qeHhTQz/8emRZiUsm2mwjA5APcQPvPQm2TsFvLhtzxGheVFfoo4wks/y9/mtVHGCDc8Bqagz9O02qb4aXP4tPW0Dmu5P4Nn9Z2c6IbI2MlUx86rhecn+YoaVQaLuDl3YqsuRezPGP2rOdPRg9Mic1cagU7OcDcVtMrJ5CxbrzkBwwp87vcf16jIrGX8r6WgxyRvNDjJthAT5xpqPDpK9P5MZRun4Pz/sbNpHowqnHGz+gLCzW7D7VIVrDOBkmEtuyEERzSlWCy0rXbGs54eGCjXBDDvN4O8wluC/lbOXg0ocUBr0ffBZVq5Y+FHMlTXnA33LDJfLX/84JvbVKSOBUPTb+Pou5Lcv2TKgCe4aUg
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(346002)(136003)(376002)(39860400002)(451199021)(8936002)(8676002)(5660300002)(52536014)(41300700001)(316002)(4326008)(66556008)(2906002)(76116006)(66946007)(66476007)(6916009)(64756008)(66446008)(54906003)(7696005)(71200400001)(6506007)(53546011)(9686003)(26005)(186003)(83380400001)(122000001)(478600001)(55016003)(33656002)(38100700002)(38070700005)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUNWbjZGZkJKNE90U3FzRVVPMnlDSUdSK2pLTVdDQzNsckR3ZmYxMGl3aVRo?=
 =?utf-8?B?dm9oMmtyQ1ZsMVRieXU2aUt5VXAzTEM5WW9oZ0JqVW9wR0M1d2VmcXU2cW9z?=
 =?utf-8?B?OElMTUpmeUttOWkxcExsWmptL2g4N0FpMStHT2NFeVA5bTRXVWtNL2FVSzRs?=
 =?utf-8?B?TFBNRFRsRHBzbFdTa3FUYVRFWmxCTFA1WEZaSUR5STZuMHpNVXhQcjBlVXVH?=
 =?utf-8?B?OE5pVTZIL0FDRWkvYmozVk52Y1JyMmNLNysxcVhkWHdHZ0xET09ZekdDVkpT?=
 =?utf-8?B?UCtSUVpGWGJqQ1hCREdaUWZVZzRCWERZYUsyQlhnYk9rZ3h6TXVoVlg2RUsx?=
 =?utf-8?B?eFFPTm9WWVRETkUxUDc3Tkwzd1d2R091SWpJLzd4OVp5YnVLdkdEU2pvV0tv?=
 =?utf-8?B?Z2p3bmFjbnAyYStQMTl0aEFWYVpxMU9QM2FBWDYxTU9USzVUMEZKNlVySEg4?=
 =?utf-8?B?TFVwTExhSit3TjBvZWxNa09yaFN2ZVBwVksrVXJGZGlsV2RaZ2lSRGhqeFBU?=
 =?utf-8?B?T0NyK2htNVlwL0hQTGpmS3BpU1RnU2s2empDVy9TTnRudmo2dHJOQmthZzhq?=
 =?utf-8?B?SEoyRnFQb3lzd1lsOW5BbjcwUHF5ODZHT3pLQXdwTWc1NWpNQ1ZNVTFuYzh4?=
 =?utf-8?B?WXJZN1YwVFd5bE5aRC9LSnpMa29jdEdlZ2FyZzJyUGFMb3R1SUNSRm5HeFJp?=
 =?utf-8?B?Zkl6RjJ6MFhLS0p1b1RyV2tjQUtVK21xNVBIWnJMQ3hjM3hlUjg5OFA3emk0?=
 =?utf-8?B?ZXFqUCtUQ0NrRTJad1RqTmg4NHR0anFqTmJWWnFEVUZGMllhaWZvTktNVk9U?=
 =?utf-8?B?Y01hR1UyNFFlOW5Eb1Y4NEVIblc4bkY4UWIzTXJKbHJuUU4xdk8yVFI2bUZw?=
 =?utf-8?B?RFFKektYMlc0ZEc1Vlk3ME1JZG83a25yT0dKY1lDaCtkbll2MXN0L0x0ZFRr?=
 =?utf-8?B?YjZBRUVERXhoME9RRXpWUUJKaG9UelpvMFZCYm1pQkdyZVBOMHJ5UHl2bmhY?=
 =?utf-8?B?aVYrdGordG91L2lIVVVrTTRjLzFocTFQVlN1QmNCc0YzaTVLdnVScFBhTjRK?=
 =?utf-8?B?dkRFNk0vclFJdkNzU2FLdW5mVEhCN2hlNEFzV1JQQ203bWFqckYrczJaaHRF?=
 =?utf-8?B?WWRiRjM5SWV0T0lnbmdLOFlYbUowZTNjSFRsejdBQkRGK0tjMitCSVdlMDdU?=
 =?utf-8?B?WDgyTFJsdEpaVWh1Q1VuOEgrNE1MbWhrcC9ZcWE2TzdHL0o5UUw1QzBzVGQr?=
 =?utf-8?B?bjV3VmlzdjBneXBjUXJiOGQ1dkxyNE50VGtrTjEwZlNpQVA5Unh0aHZoaWtH?=
 =?utf-8?B?Z3dyVE9EOFRzUWVVS1M1SG94RGwvbDR4VnZUbHdqallhNityQWl3SWx5dkdF?=
 =?utf-8?B?bDJCM1VFNmc1dVViMmM1UXMvQkV0cG02N1hacmxKUmtRZ0tkbEhNTGF4ZW9a?=
 =?utf-8?B?WG9OUUNyT2RhdUs0UTRIR29DYzhSNVpKTGFRTDlLV1VDOFRBVURGNjFpTGJF?=
 =?utf-8?B?YzBldWlzYmlmVmRSQVREWldHRU9nWWtqMm8wVnkwN3MvN0U5YUVTeFNVQUhB?=
 =?utf-8?B?Z0tTK2d5QXZMZkJrVE9hWEsvN3VCOUl0aFI3UVZmb1orUWVvcnhRWnViZ2VS?=
 =?utf-8?B?bWVleHFBVWpRVHBTamgzKzRtU2hrb1grQ01BZTVSQ2pmSjIwcm1qc21NR21t?=
 =?utf-8?B?dDdUeGdzRHYzNUZRbjN4VWpEYkpDemIvZW9DWnY2SEZwSGpjVG10SUxydGpv?=
 =?utf-8?B?dFVtOUwxYWp3RjhpdE9RRkpOOTBpdVVZc0EwZC9SL25sTXVicGs0S1VROFhk?=
 =?utf-8?B?WGF5WWpsbStoV2V2Nk8xRW1NQU1XL1NXbGNYL2o2clcwQWhZbDZaRWNxNHcy?=
 =?utf-8?B?WjJEejArSmdsaEFjdjFxWXQyQ1RiNlZua2Yrb0ZnQ0FwdjFwVVM1ZXlaQzQ3?=
 =?utf-8?B?Tmk5ZFBPZ2ZSL0NSR0QvbnRvUVlWYmM3cmNhMWM2RDVscm1UQ3EvR0xjbUFr?=
 =?utf-8?B?bFdSR0xOWXFjUENzY3BFREY2MVpwQjM2bGNpNkRzRlJhaDk0RjRpb3VxY29Z?=
 =?utf-8?B?M0ovQ0U1VitSOEMrWFZnSDNOL1ZrYWVPa3hLaUN6NUU0cTBBNzlRL0tsNmpL?=
 =?utf-8?Q?vn1bMZtBy/fPr61O8q9nOVo3O?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98d6be1b-0eaa-4319-be3b-08db65bf8d69
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2023 12:22:38.8347
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eURDh+ytlvwNW/wpcYccHyxKDnhk6mUwkkCN25mvbk1xKzBvlP+/jZwRKxTtO+qOuwtwwjuEi3tBZIF2IUYBTurz68WRP7aEWt2xzRXn6cE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8639
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
UEFUQ0ggdjYgMTEvMTFdIHJ0YzogaXNsMTIwODogQWRkIHN1cHBvcnQgZm9yIHRoZSBidWlsdC1p
bg0KPiBSVEMgb24gdGhlIFBNSUMgUkFBMjE1MzAwDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24g
RnJpLCBKdW4gMiwgMjAyMyBhdCA0OjI14oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJl
bmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBUaGUgYnVpbHQtaW4gUlRDIGZvdW5kIG9uIFBNSUMg
UkFBMjE1MzAwIGlzIHRoZSBzYW1lIGFzIElTTDEyMDguDQo+ID4gSG93ZXZlciwgdGhlIGV4dGVy
bmFsIG9zY2lsbGF0b3IgYml0IGlzIGludmVydGVkIG9uIFBNSUMgdmVyc2lvbiAweDExLg0KPiA+
IFRoZSBQTUlDIGRyaXZlciBkZXRlY3RzIFBNSUMgdmVyc2lvbiBhbmQgaW5zdGFudGlhdGVzIHRo
ZSBSVEMgZGV2aWNlDQo+ID4gYmFzZWQgb24gaTJjX2RldmljZV9pZC4NCj4gPg0KPiA+IFRoZSBp
bnRlcm5hbCBvc2NpbGxhdG9yIGlzIGVuYWJsZWQgb3Igbm90IGlzIGRldGVybWluZWQgYnkgdGhl
IHBhcmVudA0KPiA+IGNsb2NrIG5hbWUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERh
cyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5
dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+ID4gLS0tDQo+ID4gdjUtPnY2
Og0KPiA+ICAqIEFkZGVkIFJiIHRhZyBmcm9tIEdlZXJ0Lg0KPiA+ICAqIFBhcnNpbmcgb2YgcGFy
ZW50IG5vZGUgaXMgbW92ZWQgZnJvbSBwcm9iZS0+aXNsMTIwOF9jbGtfcHJlc2VudCgpDQo+ID4g
ICogQWRkZWQgY29tbWVudCBmb3IgcGFyc2luZyBwYXJlbnQgbm9kZSBmb3IgZ2V0dGluZyBjbG9j
ayByZXNvdXJjZS4NCj4gPiAgKiBSZXBsYWNlZCBYT1ItPk5PVCB0byBtYWtlIHRoZSBvcGVyYXRp
b24gbW9yZSBjbGVhciBmb3IgdGhlIGludmVydGVkDQo+IGNhc2UuDQo+IA0KPiBUaGFua3MgZm9y
IHRoZSB1cGRhdGUhDQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvcnRjL3J0Yy1pc2wxMjA4LmMNCj4g
PiArKysgYi9kcml2ZXJzL3J0Yy9ydGMtaXNsMTIwOC5jDQo+IA0KPiA+IEBAIC04MjIsMTQgKzgz
MSwzMiBAQCBpc2wxMjA4X2Nsa19wcmVzZW50KHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQsDQo+
IGNvbnN0IGNoYXIgKm5hbWUpDQo+ID4gICAgICAgICBzdHJ1Y3QgY2xrICpjbGs7DQo+ID4gICAg
ICAgICBpbnQgcmV0Ow0KPiA+DQo+ID4gLSAgICAgICBjbGsgPSBkZXZtX2Nsa19nZXRfb3B0aW9u
YWwoJmNsaWVudC0+ZGV2LCBuYW1lKTsNCj4gPiAtICAgICAgIGlmIChJU19FUlIoY2xrKSkgew0K
PiA+IC0gICAgICAgICAgICAgICByZXQgPSBQVFJfRVJSKGNsayk7DQo+ID4gLSAgICAgICB9IGVs
c2Ugew0KPiA+IC0gICAgICAgICAgICAgICBpZiAoIWNsaykNCj4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICByZXQgPSAwOw0KPiA+IC0gICAgICAgICAgICAgICBlbHNlDQo+ID4gKyAgICAgICAv
Kg0KPiA+ICsgICAgICAgICogRm9yIHRoZSBidWlsdC1pbiBSVEMgZm91bmQgb24gUE1JQyBSQUEy
MTUzMCwgZW5hYmxpbmcgb2YNCj4gdGhlDQo+ID4gKyAgICAgICAgKiBpbnRlcm5hbCBvc2NpbGxh
dG9yIGlzIGJhc2VkIG9uIHRoZSBwYXJlbnQgY2xvY2suIFNvIHBhcnNlDQo+IHRoZQ0KPiA+ICsg
ICAgICAgICogcGFyZW50IG5vZGUgdG8gZ2V0IHRoZSBkZXRhaWxzLg0KPiA+ICsgICAgICAgICov
DQo+ID4gKyAgICAgICBpZiAoY2xpZW50LT5kZXYucGFyZW50LT50eXBlID09ICZpMmNfY2xpZW50
X3R5cGUpIHsNCj4gPiArICAgICAgICAgICAgICAgY2xrID0gb2ZfY2xrX2dldF9ieV9uYW1lKGNs
aWVudC0+ZGV2LnBhcmVudC0+b2Zfbm9kZSwNCj4gbmFtZSk7DQo+ID4gKyAgICAgICAgICAgICAg
IGlmIChJU19FUlIoY2xrKSkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlmIChQVFJf
RVJSKGNsaykgIT0gLUVOT0VOVCkNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHJldCA9IFBUUl9FUlIoY2xrKTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBlbHNlDQo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSAwOw0KPiA+ICsgICAgICAg
ICAgICAgICB9IGVsc2Ugew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsa19wdXQoY2xr
KTsNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICByZXQgPSAxOw0KPiA+ICsgICAgICAgICAg
ICAgICB9DQo+IA0KPiBQZXJoYXBzIHJlc2h1ZmZsZSB0aGUgY29uZGl0aW9ucyB0byBkZWNyZWFz
ZSBpbmRlbnRhdGlvbj8NCj4gQW5kIHJldHVybiBlYXJseT8NCj4gDQo+ICAgICBpZiAoIUlTX0VS
UihjbGspKSB7DQo+ICAgICAgICAgICAgIGNsa19wdXQoY2xrKTsNCj4gICAgICAgICAgICAgcmV0
dXJuIDE7DQo+ICAgICB9DQo+IA0KPiAgICAgaWYgKFBUUl9FUlIoY2xrKSAhPSAtRU5PRU5UKQ0K
PiAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihjbGspOw0KPiANCj4gICAgIHJldHVybiAwOw0K
DQpBZ3JlZWQuDQoNCj4gDQo+IA0KPiA+ICsgICAgICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAg
ICAgICAgY2xrID0gZGV2bV9jbGtfZ2V0X29wdGlvbmFsKCZjbGllbnQtPmRldiwgbmFtZSk7DQo+
ID4gKyAgICAgICAgICAgICAgIGlmIChJU19FUlIoY2xrKSkgew0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJldCA9IFBUUl9FUlIoY2xrKTsNCj4gPiArICAgICAgICAgICAgICAgfSBlbHNl
IHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpZiAoIWNsaykNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJldCA9IDA7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgZWxzZQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gMTsNCj4g
PiArICAgICAgICAgICAgICAgfQ0KPiANCj4gU2FtZSBjb21tZW50cyBhcyBbUEFUQ0ggdjYgMTAv
MTFdLg0KDQpPSywgd2lsbCBkbyB0aGlzIGNoYW5nZSBpbiB2Ny4NCg0KQ2hlZXJzLA0KQmlqdQ0K
DQo+IA0KPiA+ICAgICAgICAgfQ0KPiA+DQo+ID4gICAgICAgICByZXR1cm4gcmV0Ow0KPiANCj4g
R3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0K
PiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBi
ZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5vcmcNCj4gDQo+IEluIHBlcnNvbmFs
IGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFj
a2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJw
cm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
