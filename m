Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9BD716AF2
	for <lists+linux-rtc@lfdr.de>; Tue, 30 May 2023 19:29:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233274AbjE3R3Y (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 30 May 2023 13:29:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232951AbjE3R3X (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 30 May 2023 13:29:23 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2092.outbound.protection.outlook.com [40.107.114.92])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7698BC5;
        Tue, 30 May 2023 10:28:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nIgItOrguBWME3l7JaSi0eupQC13Hm66eyy2FksxR8ZrcmjGWsPO83IEhl1/TgdkIlgpdGjNph33BOr7fG+u+TbwSlTXTOjEGc9a3JEfPbZIk/Mny9C2/kL4n7l/sqHSYYiRDxIbMAZbxQehum+4S8azIjdlUTkwgEqlC3gQqG4aeaT1S8v/O5OefQzCwy7jxG6UvvbUjDbLM8siQXFVpD3K8Ow4P9BsrYjRgC92KtbBD/D7+AFlKFKmltRGof09mY5gLVUgNDAMbdsrJ/ArUrmg7HYW2OVDLK9EBFVF6HhT6geno5TRoCOAbVMa6bXx+Ugb5Priy+pYgbA5avN2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8dJYOpranltFplZ3ZZiiU7JvmPhj01rmSsIoPDkgfk=;
 b=eM7mhrSocMbxN6zWJaivU8oMSjwz7gxEYizZdoKS6FDc6I7Fq65P2pmwWsfpSjeCVDzguzO1RIJKxo4QPUPKo3nnwew1YNmr2GI8uPAYhMik3vTEffEQuKs/vLN5CrG2MZArJypuJrdmriRn5ZeLR/PFzVsHkwWVwlJUbji//aLvpqOKGVr0l6xElSFgr4Yinp7b5IqVo8Ah0ewpXwrYsGwoZmnz0HQn4JQxRfh3AiWO3lLlqoVy8Zgw4lkwkcRemT70L7pKhfxAluJMIna9tQTRMlA0iwI8t72qdvV9GT8lDXpLgTYZq0pKoREYnGQHZv4PUTqFQe1RQje1vIqDcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x8dJYOpranltFplZ3ZZiiU7JvmPhj01rmSsIoPDkgfk=;
 b=mUp67AUynomrVF88BSCOYws3viFMBDNU7urKWflDVoX07HSDJj4vQgXlRTR1AOWpTx4hrhEfgYpi3akuKc2ekkPBuci8UQqbynGZCQDrbaDZtSs1BGPN/qVprKroN6rZPOgwVjX0quPH5l5wstyYmZZtLFTKSNcQUfcq9yCPx5M=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TYCPR01MB8549.jpnprd01.prod.outlook.com (2603:1096:400:154::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Tue, 30 May
 2023 17:28:48 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6455.020; Tue, 30 May 2023
 17:28:48 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v5 08/11] rtc: isl1208: Add support for the built-in RTC
 on the PMIC RAA215300
Thread-Topic: [PATCH v5 08/11] rtc: isl1208: Add support for the built-in RTC
 on the PMIC RAA215300
Thread-Index: AQHZjJbkEMhnhMgw90uyqiZLe9odRq9sMAaAgAbu1gA=
Date:   Tue, 30 May 2023 17:28:48 +0000
Message-ID: <OS0PR01MB59227B00EB2C4AA91E3E4772864B9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230522101849.297499-1-biju.das.jz@bp.renesas.com>
 <20230522101849.297499-9-biju.das.jz@bp.renesas.com>
 <CAMuHMdXSf0wteEcL9+DGCAqsMX95ULf22=oMEJYGrn_PEm=vRg@mail.gmail.com>
In-Reply-To: <CAMuHMdXSf0wteEcL9+DGCAqsMX95ULf22=oMEJYGrn_PEm=vRg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TYCPR01MB8549:EE_
x-ms-office365-filtering-correlation-id: cb325924-afb8-4e6f-ebda-08db61335400
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5HncSAnvKPlxONdBautjbceWPfq4k0tSYZMC0v8/3whsKDximytATIuOaR5JpTzfsf2bvweYEBSLGuNQJXwpC2E4JbVgYNXYhW+CxDNkegQEhR6Q+C1QTuQfKXrSsg7F4qEDcTMxCwBIOLiVwc0bMqi1I3gauiz+f6n5SsdKQ6hQjH4dUJa2cbEe0tu6YzNcrgS2cFM8wiV5w+LM6PyoI8RdyiojOU51tY1dQXV197Amemlwgblp2j6fYrUyA2tzCVVcHU5lDLh5nunqcGt5KH+K6vR2m11PlkQjz+1K0vcLplIAS2zP25Iepv7/5rx5QTzV2YLCnczu6vioBrsF2JntLIr0/H10mdFC13rZY7jfx+Ogyhfm/zSYvXlf/FXvPBdsmWKNGgHhIVzcIKg/Ly4UyN5+oHoYp00FKrr6+qO+8tmvhTKbcqhRg4nDDkq2unl0vitBEyMZK4QM7ZNruD4Y/Y/m2bcyLD11XlAz6LG5tXcSfco1wJ6tYFlbuLHEPvTGmzt4N88zMG9iBxulTc3wokzmr7Tae6CAp1SEHrbX8XmiHIfXkF6WXZiTsJET733LGE1L9cwKXLo8+fvTP9Tmon8UBkv+hhdSHnP9rMRPGm6Oidjbe2lKwvI2UcGH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(366004)(136003)(376002)(396003)(39860400002)(451199021)(52536014)(9686003)(53546011)(6506007)(26005)(6916009)(66946007)(76116006)(66476007)(66446008)(64756008)(66556008)(122000001)(38100700002)(4326008)(5660300002)(8676002)(8936002)(33656002)(83380400001)(86362001)(41300700001)(54906003)(316002)(71200400001)(55016003)(7696005)(186003)(2906002)(478600001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UXQzaTN5NnVmMmJxbjNDbTM2YS90VUpoRTRnQzlCT1hrVi9keGNUWlMrYzBj?=
 =?utf-8?B?RjFaMFhUbXBRQXBmeDdqQW9rZGZGaWR2QTNkNzhYblFUaHhiQ3R0Z3VORkt1?=
 =?utf-8?B?Q3BhaHl1bFZBZ3JheWE5aDYwbi9NNHF4V0hZWmRmZ3BkYkJCSmU2MlhoZ0dZ?=
 =?utf-8?B?UWJYV3Z4WFRFMlhISWE1NEg5Y21nK3NLSWxQbkRLL3VJZTE4NmI0K1g5cTV0?=
 =?utf-8?B?TjF0eGE4N1lGdjFmOEgwak44NjQ3ZmpTektYSkkyL1NUQnN3RW5BNnRBcTVz?=
 =?utf-8?B?cVZBUXRkbHBueW94OVU0NDNmaG84SVBnRmcxRENTMXFyMTJhd3ZNUmZ6U0pB?=
 =?utf-8?B?NzM5L3B4TUdhVGZtbFVmL1pseDd2RS9NWWozOW5jQTU2SlIzbTVGTG5ZOXRX?=
 =?utf-8?B?Qm1PbUNaQnBqMGJRZzYwb0x0RVZnZFNCb0wvNzU1SEpwNjhJVjMzOVd4Mlk4?=
 =?utf-8?B?UkRrd3dnaitiRHdTMG5MekJ4K1NrTEtvQUN6anZMc2g0Zk5DZUp6UmNPNVF1?=
 =?utf-8?B?SVNOb243SU5PTENhdEI3RlhIcnk1cTlpU21kOTFQVnZvN2l4bXFnbVdXVCti?=
 =?utf-8?B?V1BRbkF6eWtselFmQk9JOXZvNVUyNzJ5N1Q5WVQvSlUwNEVzTW15Q3pDOGV3?=
 =?utf-8?B?UkVGb2xjaTFTeVdtamVobzV2WCs4M2R2bGtLR1NFSXNMM1FBbzBnSGF3Qitj?=
 =?utf-8?B?QktpV0szQ0FBQ3FqWW43YitMa3V0MUVuMkg1dk5nVjBHU05YN0lVcEdiSEhV?=
 =?utf-8?B?OTJxMWMrbVhwQWhlRFRhMnJYLzI4eVhMTUlyaCtBaTRXbmVjTWtCeFhyM3c1?=
 =?utf-8?B?YVJNUTNwMC82WHhjaG05T1Y2THZrQnJPTVZEVzRuOUNMaVd3NFJCeUVQVXcy?=
 =?utf-8?B?Q1p2ZnRHRUQzNnhJNm8rMk9oc0EzeWRGRkFONkpKdm1tODdPV2x6R2d5cGdl?=
 =?utf-8?B?QVp0b3c4cGxDb0JEaEprRVRUaFQ2OE0zUkNWSk1xeXl2STg5dlZUSk80UDEx?=
 =?utf-8?B?amxicUExVndqNmF1RkI0R3AySVZZdVFZMjluTU1qNjFlSlRvQTlKVnZkOFk1?=
 =?utf-8?B?VlpqVXBiQWxHd3JrMmR5SFh1WGg1Mjg3Sk9iMkpZVHUxRlExNit6Ly9SR1Bq?=
 =?utf-8?B?THpZN3ppMnkxMnY2dTZkTFlFbERHa2g3L3VlTUJyNFBQUWxOOEY1TjlPQTFS?=
 =?utf-8?B?UlhGRlZtOEl1RnhZWnp5WW10dlE2Zkp0My9ENVZ6eWxKaU5xL1BOUUNXeVd6?=
 =?utf-8?B?blBaNDNqaXAvUjZyR0N2VHMzV3VRSFNTWXRmb1N3cnMwT0EvUkJyaG96ODVx?=
 =?utf-8?B?RmFxSTdZMFd0T0tSc3FiUTVZZXlXZzh4ZHJTTUN4Q2RTelhGbmZRUEsyRE5H?=
 =?utf-8?B?enErb2lCSkV3emJmQ0Q4S3NPN3h4M3NUNVBibDl0d0dHODFOaUVhc2NuOW9a?=
 =?utf-8?B?Q2xoZXRzQXhpalJjaytySEdNbUtHSGxkNjAzcVR4bDNqZ01lUi8xRkVUejh4?=
 =?utf-8?B?cTZzeDNRbnRZOWViOVVKTlFZb2Z0ck42U3phdFFUa3FKdlFpU0U3T3FFQVVY?=
 =?utf-8?B?UFRjN25ZSU8zeEEwTGRIcExJa3J1cndsek85MUNNZlJLNFgxYmxnejNORVpQ?=
 =?utf-8?B?SFZsbnd6dGFQRmM2V0R6OHoyNWlxWTdaVVp1VW01akxqMGM1MUl0S2hiOWxx?=
 =?utf-8?B?cHMxY1JhMEJPSGs4d0F0eUZkOHdKWWdTM04zYXFyZmdRYThheWMwRDVsNHRY?=
 =?utf-8?B?UUNSdklqbXBXWmw5YUN6b1JoZmxucVVBM08rM1UrNC96NGx2RFNKTUVQenBq?=
 =?utf-8?B?dlRiRHo3Um11MkR1c0xYN3lwMnpmL011TWtUTUd3emlPT1dtTTVmc09Fd3Bv?=
 =?utf-8?B?TldkVU9zVnowRzFlTjIrS1VjYUdPL2pvUXYyeCt0MzBpVHRyS3VTbVphQlhx?=
 =?utf-8?B?TE5zSldBbUFnMTNQN2hrb3BvM3F4QUV5V04ycXJXZU1yVW13K0x0OXk2OFVI?=
 =?utf-8?B?eXF6T1RrQllEbmplbTY1RnhCeUs5eXViaFZycjlEaVp6RWtTYnMzcTZwYXhE?=
 =?utf-8?B?T01Kb3hvNUM1RmdPbEpJUklVQTNDQ05SSWpROU94MzJOVGIvMFBPWlFTUDlC?=
 =?utf-8?B?Q283UHhta1lia3VkM2dHM3NqWFhkcTJhak1HS0hhU2lqcjMzVnhGVGJsenF5?=
 =?utf-8?B?Z1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb325924-afb8-4e6f-ebda-08db61335400
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2023 17:28:48.3134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vVa7DHJRiqtB8wEqsD+n4ri4IJN+jn9t2F32z2yttfgWt1AK54103mQtCvVcUNR7R2Hfh2s4MEodnD2VjNi+HsYaEgxsUpu+fnhz2jBTARQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8549
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
UEFUQ0ggdjUgMDgvMTFdIHJ0YzogaXNsMTIwODogQWRkIHN1cHBvcnQgZm9yIHRoZSBidWlsdC1p
bg0KPiBSVEMgb24gdGhlIFBNSUMgUkFBMjE1MzAwDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24g
TW9uLCBNYXkgMjIsIDIwMjMgYXQgMTI6MTnigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAu
cmVuZXNhcy5jb20+DQo+IHdyb3RlOg0KPiA+IFRoZSBidWlsdC1pbiBSVEMgZm91bmQgb24gUE1J
QyBSQUEyMTUzMDAgaXMgdGhlIHNhbWUgYXMgSVNMMTIwOC4NCj4gPiBIb3dldmVyLCB0aGUgZXh0
ZXJuYWwgb3NjaWxsYXRvciBiaXQgaXMgaW52ZXJ0ZWQgb24gUE1JQyB2ZXJzaW9uIDB4MTEuDQo+
ID4gVGhlIFBNSUMgZHJpdmVyIGRldGVjdHMgUE1JQyB2ZXJzaW9uIGFuZCBpbnN0YW50aWF0ZXMg
dGhlIFJUQyBkZXZpY2UNCj4gPiBiYXNlZCBvbiBpMmNfZGV2aWNlX2lkLg0KPiA+DQo+ID4gVGhl
IGludGVybmFsIG9zY2lsbGF0b3IgaXMgZW5hYmxlZCBvciBub3QgaXMgZGV0ZXJtaW5lZCBieSB0
aGUgcGFyZW50DQo+ID4gY2xvY2sgbmFtZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUg
RGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gPiAtLS0NCj4gPiB2NC0+djU6DQo+
ID4gICogVXBkYXRlZCBjb21taXQgZGVzY3JpcHRpb24uDQo+ID4gICogUmVwbGFjZWQgInVuc2ln
bmVkIGxvbmciLT4ia2VybmVsX3Vsb25nX3QiIGluIGlzbDEyMDhfaWRbXS4NCj4gPiAgKiAtRU5P
RU5UIG1lYW5zIGNsb2NrIG5vdCBwcmVzZW50LCBzbyBhbnkgb3RoZXIgZXJyb3JzIGFyZQ0KPiBw
cm9wYWdhdGVkLg0KPiA+ICAqIERyb3BwZWQgYm9vbCBpbnZlcnRlZCBwYXJhbWV0ZXIgZnJvbSBp
c2wxMjA4X3NldF94dG9zY2IoKSBpbnN0ZWFkDQo+ID4gICAgdXNpbmcgeG9yIHRvIGNvbXB1dGUg
dGhlIHZhbHVlIG9mIHh0b3NjYi4NCj4gDQo+IFJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPg0KPiANCj4gU29tZSBzdWdnZXN0aW9ucyBmb3Ig
aW1wcm92ZW1lbnQgYmVsb3cuLi4NCj4gDQo+ID4gLS0tIGEvZHJpdmVycy9ydGMvcnRjLWlzbDEy
MDguYw0KPiA+ICsrKyBiL2RyaXZlcnMvcnRjL3J0Yy1pc2wxMjA4LmMNCj4gDQo+ID4gQEAgLTg1
MiwxNyArODYxLDM3IEBAIGlzbDEyMDhfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkN
Cj4gPiAgICAgICAgICAgICAgICAgaXNsMTIwOC0+Y29uZmlnID0gKHN0cnVjdCBpc2wxMjA4X2Nv
bmZpZyAqKWlkLQ0KPiA+ZHJpdmVyX2RhdGE7DQo+ID4gICAgICAgICB9DQo+ID4NCj4gPiAtICAg
ICAgIHhpbiA9IGRldm1fY2xrX2dldF9vcHRpb25hbCgmY2xpZW50LT5kZXYsICJ4aW4iKTsNCj4g
PiAtICAgICAgIGlmIChJU19FUlIoeGluKSkNCj4gPiAtICAgICAgICAgICAgICAgcmV0dXJuIFBU
Ul9FUlIoeGluKTsNCj4gPiArICAgICAgIGlmIChjbGllbnQtPmRldi5wYXJlbnQtPnR5cGUgPT0g
JmkyY19jbGllbnRfdHlwZSkgew0KPiANCj4gSSB0aGluayB0aGlzIGRlc2VydmVzIGEgY29tbWVu
dCwgdG8gZXhwbGFpbiB3aHkgeW91IGFyZSBsb29raW5nIGF0IHRoZQ0KPiBwYXJlbnQuDQoNCk9L
LCB3aWxsIGRvLg0KDQo+IA0KPiA+ICsgICAgICAgICAgICAgICB4aW4gPSBvZl9jbGtfZ2V0X2J5
X25hbWUoY2xpZW50LT5kZXYucGFyZW50LT5vZl9ub2RlLA0KPiAieGluIik7DQo+ID4gKyAgICAg
ICAgICAgICAgIGlmIChJU19FUlIoeGluKSkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGlmIChQVFJfRVJSKHhpbikgIT0gLUVOT0VOVCkNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiBQVFJfRVJSKHhpbik7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGNsa2luID0gb2ZfY2xrX2dldF9ieV9uYW1lKGNsaWVudC0+ZGV2LnBhcmVudC0N
Cj4gPm9mX25vZGUsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgImNsa2luIik7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKElT
X0VSUihjbGtpbikpIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChQ
VFJfRVJSKGNsa2luKSAhPSAtRU5PRU5UKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUih4aW4pOw0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIH0gZWxzZSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB4dG9z
Yl92YWwgPSAwOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY2xrX3B1dChj
bGtpbik7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgICAgICAg
ICB9IGVsc2Ugew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGNsa19wdXQoeGluKTsNCj4g
PiArICAgICAgICAgICAgICAgfQ0KPiA+ICsgICAgICAgfSBlbHNlIHsNCj4gPiArICAgICAgICAg
ICAgICAgeGluID0gZGV2bV9jbGtfZ2V0X29wdGlvbmFsKCZjbGllbnQtPmRldiwgInhpbiIpOw0K
PiA+ICsgICAgICAgICAgICAgICBpZiAoSVNfRVJSKHhpbikpDQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIFBUUl9FUlIoeGluKTsNCj4gPg0KPiA+IC0gICAgICAgaWYgKCF4aW4p
IHsNCj4gPiAtICAgICAgICAgICAgICAgY2xraW4gPSBkZXZtX2Nsa19nZXRfb3B0aW9uYWwoJmNs
aWVudC0+ZGV2LCAiY2xraW4iKTsNCj4gPiAtICAgICAgICAgICAgICAgaWYgKElTX0VSUihjbGtp
bikpDQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoY2xraW4pOw0K
PiA+ICsgICAgICAgICAgICAgICBpZiAoIXhpbikgew0KPiA+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGNsa2luID0gZGV2bV9jbGtfZ2V0X29wdGlvbmFsKCZjbGllbnQtPmRldiwNCj4gImNsa2lu
Iik7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKElTX0VSUihjbGtpbikpDQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihjbGtpbik7DQo+
ID4NCj4gPiAtICAgICAgICAgICAgICAgaWYgKGNsa2luKQ0KPiA+IC0gICAgICAgICAgICAgICAg
ICAgICAgIHh0b3NiX3ZhbCA9IDA7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKGNs
a2luKQ0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgeHRvc2JfdmFsID0gMDsN
Cj4gPiArICAgICAgICAgICAgICAgfQ0KPiANCj4gSSB0aGluayBpdCB3b3VsZCBtYWtlIHRoZSBj
b2RlIG1vcmUgcmVhZGFibGUgaWYgeW91IHdvdWxkIHNwaW4gb2ZmIHRoZQ0KPiBPRiB2cy4gZGV2
LWJhc2VkIGNsb2NrIGhhbmRsaW5nIGludG8gYSBzZXBhcmF0ZSBoZWxwZXIgZnVuY3Rpb24uDQo+
IFRoZW4geW91IGNhbiBqdXN0IGRvIGluIHRoZSBwcm9iZSBmdW5jdGlvbjoNCg0KT0suDQoNCj4g
DQo+ICAgICByZXQgPSBpc2wxMjA4X2Nsa19wcmVzZW50KGNsaWVudCwgInhpbiIpOw0KPiAgICAg
aWYgKHJldCA8IDApDQo+ICAgICAgICAgcmV0dXJuIHJldDsNCj4gICAgIGlmICghcmV0KSB7DQo+
ICAgICAgICAgICAgIHJldCA9IGlzbDEyMDhfY2xrX3ByZXNlbnQoY2xpZW50LCAiY2xraW4iKTsN
Cj4gICAgICAgICAgICAgaWYgKHJldCA8IDApDQo+ICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IHJldDsNCj4gICAgICAgICAgICAgaWYgKHJldCkNCj4gICAgICAgICAgICAgICAgICAgICB4dG9z
Yl92YWwgPSAwOw0KPiAgICAgfQ0KPiANCj4gPiAgICAgICAgIH0NCj4gPg0KPiA+ICAgICAgICAg
aXNsMTIwOC0+cnRjID0gZGV2bV9ydGNfYWxsb2NhdGVfZGV2aWNlKCZjbGllbnQtPmRldik7DQo+
ID4gQEAgLTg4Miw2ICs5MTEsNyBAQCBpc2wxMjA4X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpj
bGllbnQpDQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiBzcjsNCj4gPiAgICAgICAgIH0NCj4g
Pg0KPiA+ICsgICAgICAgeHRvc2JfdmFsIF49IGlzbDEyMDgtPmNvbmZpZy0+aGFzX2ludmVydGVk
X29zY19iaXQgPyAxIDogMDsNCj4gDQo+IEFzIGhhc19pbnZlcnRlZF9vc2NfYml0IGlzIGFscmVh
ZHkgZWl0aGVyIDAgb3IgMToNCj4gDQo+ICAgICB4dG9zYl92YWwgXj0gaXNsMTIwOC0+Y29uZmln
LT5oYXNfaW52ZXJ0ZWRfb3NjX2JpdDsNCj4gDQo+IElmIHlvdSBkb24ndCB0cnVzdCBYT1IsIG9y
IHdhbnQgdG8gbWFrZSB0aGUgb3BlcmF0aW9uIG1vcmUgY2xlYXI6DQoNCkkgd2lsbCBnbyB3aXRo
IGNsZWFyZXIgb25lLg0KDQpDaGVlcnMsDQpCaWp1DQo+IA0KPiAgICAgaWYgKGlzbDEyMDgtPmNv
bmZpZy0+aGFzX2ludmVydGVkX29zY19iaXQpDQo+ICAgICAgICAgICAgIHh0b3NiX3ZhbCA9ICF4
dG9zYl92YWw7DQo+IA0KPiA+ICAgICAgICAgcmMgPSBpc2wxMjA4X3NldF94dG9zY2IoY2xpZW50
LCBzciwgeHRvc2JfdmFsKTsNCj4gPiAgICAgICAgIGlmIChyYykNCj4gPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIHJjOw0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAg
ICAgICAgICAgICAgICBHZWVydA0KPiANCj4gLS0NCj4gR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRo
ZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC0NCj4gbTY4ay5v
cmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxl
LCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLg0KPiBCdXQgd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcNCj4gbGlrZSB0aGF0
Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
