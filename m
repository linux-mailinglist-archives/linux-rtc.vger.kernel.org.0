Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7A6D1709BF2
	for <lists+linux-rtc@lfdr.de>; Fri, 19 May 2023 18:02:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232408AbjESQCe (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 19 May 2023 12:02:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232399AbjESQC3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 19 May 2023 12:02:29 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2100.outbound.protection.outlook.com [40.107.113.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE02110E3;
        Fri, 19 May 2023 09:02:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SnrXXsvILZGSPO/cNnZ4yXmSbv1pYrVWI9GCzVvj7bXm+ohHXgkoeio9F84tOM0djXA/Zo7p/Yok21a6GDYMvVk0vJnWqqsXkC08fX2bb+ImOd7rT0BQ3Y2rKGI3jYVG+A6NI8CFdNhAGhm6ylS0Pox8tzPd3IxO5ioeq6fqcBlRWK3jzI67Q6io/jJcyUwHyZVKqco7uktocJ8Eo37JpIEjH5DAqSf7SySlx+bb1L9XHyeW5uHUFyuSnr05Z2H/rgVxWaErl7mSmE7a8hxak1wKtiRPGMaDTHxxhg8UxuIFFqtdgwNtPK/aTeX0rnnvnc5UNCYCKAEnrn1nZIJWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cJcC7xgkLCQVKxHsaJkYRflJhcGSZQb17OLpCE/Mtqg=;
 b=M7P1OchzSpkPFoXp3bNk8jm0/Q+2pn17Uu4lf2CItI2sSJCFYTqjlEERUxzJOJlx02tFBY3Yf5D6tll0fW/qFdYPJshxgkWr+1v8mZ/MuqQ+x62nLP4aO+JSxRqgpQrrg1gOSP+bTjGY86oGQSXDPQzQBljIcNhBjnLiZ+O4KBqR7yD6wWneguIxewQu5lGRwPcvGxUU3v4TRv7g7XlIOZWT1Bm+MPWPfmTscnMKHt7kfe3oQJHXk16e96O+6sSgd4zzKxvedbL8Nzuh1si6+1TBt66mTXzookTSMK42W8W0ExfkBFe2wVm8Q2sjYd81d18X06c2UeIu/1R2cQb+Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cJcC7xgkLCQVKxHsaJkYRflJhcGSZQb17OLpCE/Mtqg=;
 b=hfTeEZ1OvnYVdHdZ38P89+U6nHIsXjgOKk5EMCtTDvnawbAH9GDSQ98EjsOobFpOodaCh6Ngdc3qOFBsN2ToTcGbGA7LjBL8vBWPSHClkHIboZ4yLsIeWRWUdk1Z9AMDx5NfUsk+kCbBZEQjJUekYoelBDf7uMuOnyOdpyPxGtI=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by TY3PR01MB11431.jpnprd01.prod.outlook.com (2603:1096:400:377::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21; Fri, 19 May
 2023 16:02:09 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::bd0a:a38d:b4d2:5d2%6]) with mapi id 15.20.6411.021; Fri, 19 May 2023
 16:02:08 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Trent Piepho <tpiepho@gmail.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v4 03/11] dt-bindings: rtc: isil,isl1208: Document clock
 and clock-names properties
Thread-Topic: [PATCH v4 03/11] dt-bindings: rtc: isil,isl1208: Document clock
 and clock-names properties
Thread-Index: AQHZiX0UMC7Xg7hLa0+xGx+ql22vQK9hieeAgAA5eGA=
Date:   Fri, 19 May 2023 16:02:08 +0000
Message-ID: <OS0PR01MB592236670968CC566C3ADD2B867C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230518113643.420806-1-biju.das.jz@bp.renesas.com>
 <20230518113643.420806-4-biju.das.jz@bp.renesas.com>
 <CAMuHMdWugibN6BDGfaNdJvi5+MQ8C0utPQJAym1gk61TEHdOdA@mail.gmail.com>
In-Reply-To: <CAMuHMdWugibN6BDGfaNdJvi5+MQ8C0utPQJAym1gk61TEHdOdA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|TY3PR01MB11431:EE_
x-ms-office365-filtering-correlation-id: f2293a19-f297-4dd5-dbb5-08db5882664c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xB664DUox1YJzc+QzlhzDhzrVkD19EYsS8rHtGvEbSsVGV3zX8YQti5KGIH77btLMbrO8yPuDLwFpacBaF0liNusXshjEGdJmt54521PgM2PuOu9/AM6s78pPh4pLrZuFkAusbUe+re/pba/zy8YLTZmhljatnD1TnBuu+OswC5Mgo7BWwiZZ63QgTTRJaj3ijxdpxwkyncwabUoRQ3Y7c/7Pktz2wEAwh1TeJ+wg2cMivw34bulnsx/WtGUZetv9nllNqZIlt3gmIGmrgH9elPTR/BTq2x9GbjoquVhfjeUi3wyDEuwYRCoZJT5CkaW7prPE2Te2+9P01BagmjXbbgp3b5Poed5dhFAn3vHq60hi0yxVrcP6wev3R37ThERLh6n0FBJKIzHhNv5ViNc2F3lXd6aRUSSOKk1Jt6Jgd+iukuLOIT/+z//duv9pME1HiXb18d7RwC0H690N/ArmE7EvG6XubgQfsfghU4ZfjCbdcdui8n+jHl7tE5smDISLRHZcLmBroN3LgnacdmGCO4cDVo/QJjL+FGFENHdzZYpzeElifhxiZS+QNlEaRLhGFRcle1nR77PgDRpbQ0dwgDpcOhvX6slWFFUlOreqx9QqrG2qXqTJAqsyh0ae/os
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199021)(86362001)(33656002)(55016003)(53546011)(8936002)(26005)(8676002)(9686003)(5660300002)(6506007)(186003)(52536014)(7416002)(316002)(54906003)(66446008)(66556008)(76116006)(66946007)(6916009)(41300700001)(66476007)(64756008)(478600001)(7696005)(4326008)(71200400001)(38100700002)(122000001)(38070700005)(83380400001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b0pPZjlKVEJmcjBkZHp1WFNiTlpDa2NCeTZReXNWbTBiNEFZNWdLcFpIcjgv?=
 =?utf-8?B?UW53Z1BUV0xqb3dCN1pGYlZhQVp3dEdCaEt2R2haYmZoSHpsUFk5MGpZMGV1?=
 =?utf-8?B?YVAzUjhvN3ppRTRHckJ0U3N5SjR2djV2MGZMUjA1SnZhWDJtUUNFZVhhMlJP?=
 =?utf-8?B?U3R4a1pGNjBSMWVYOUlHQWhpcVJjd0wwbHlDd3BwTFJRbjlHU2ltRXl6bWla?=
 =?utf-8?B?Uk1UR0JsSUVvdFZncWZYN0JwRU5PWDlGKy9uU3JpMkdCbm55Tm1XMW96Nlc4?=
 =?utf-8?B?YWhMbWwwendTb3lCdFpRZEYrdU4vbkhHelJYZ0dMeGlRcGZLN1cwV2tOQzJN?=
 =?utf-8?B?aUpqT09DbVRUNXJmMDNPU0RtbTBIemNKRm9wbWdobFM1dzNwUldYOXpFYTVv?=
 =?utf-8?B?ZjdvdlI0WERpcHNrVys5NGlWNU9qbmEwdFhMdGtuK2JIZWU0YUl5ckthNUpk?=
 =?utf-8?B?MUN3WElHY2JRNkFsNGptU1IyK2ZqOUFCZmZia2xyWEUzTSt3V3IyZXozaUJV?=
 =?utf-8?B?bnNIbFpZUHBzWmxMNXQ2WE9ZYzZMZE9YVmlRaXVtZkw5d2FWWXkwb2diQThU?=
 =?utf-8?B?UHNMSk5hQmlqdWovcFQvSU1rd1h3Vi9HcXFtQjYxVEs0ZlJxcGR3VTVKdnp5?=
 =?utf-8?B?RjdsdTFhaTZqSUppUU9ldit3eUFzSkUyQ3pLR0RaRnFOT1V1OFEzOUhjUEhn?=
 =?utf-8?B?T1FJa203Vml4VHNxTzRyRElRMHlkSTFIcGIwb1VmU2FUaW91UFZiR21MalVv?=
 =?utf-8?B?eXBFc3A4cmw0dzBEL3kweSt0ZE5xTlhXbTJyTHhKM1FxYm1wVnh2V0ptQ0po?=
 =?utf-8?B?azdIYWFOaFpGWUoxV2w1TU5ISk5ZaWF5WVkraXpIQjdkMUQvSE5GTGN0UHNq?=
 =?utf-8?B?S21sR2JaQ1Y2ZHAwd0RYclFKb0VxQkFLNzdCUlQ0dEROcXI5bWp0YWdiRURF?=
 =?utf-8?B?blJVcTJXVFVIQTJUYmNoT1Yxb0paZnNweFkrNjJtTC9hS3FvYW9oQ05tZCsz?=
 =?utf-8?B?aWRoTkRMb0FBbWtDVHAzZTc1VStRVDV2Q2R1TzZVWTFjYnkxcHhmODFEL1Nn?=
 =?utf-8?B?Ri85am55WWI5Z21LOFFucE4raWlEaS9IdERVclB1b0VxY0xTWnEvN3drNnBt?=
 =?utf-8?B?ZkJlYUVvTFpEUDhzSnI2ckYvVndMd085TXNOdlhYdjJvYzJRaTI3WGZ1ZDhp?=
 =?utf-8?B?TXUxRlNMQ296ZnREMlJPZFBQZnp5ZnpEM0dYaUdxVm1QOEN3QnZxVTR3UGZ6?=
 =?utf-8?B?ZjVneVZ1OXZseWNxTkxVcWx4bjFPVHdHci9WcTVMTHdJZ1R0MlN1T2pkQ21H?=
 =?utf-8?B?MWxabXhLdGxFRUJpQS9QeDBuSGk5em14TVFpNmRxbmtRSzB0cVlCZWpTMzhu?=
 =?utf-8?B?NzZwRGROZ0RLWkdnb3FTbS90ZzlKQXd4TmtYMGVpbVBqM2t0OFdXdkFlOHU4?=
 =?utf-8?B?UXlOSjYxSkVmVWpocUJFOHVwKzBaL0srRTlwTlVFaUNObDlpVUtDUGtqaStP?=
 =?utf-8?B?U3Fhd2lvQWpYREpkQzZKY0pxK2w3eXl4TTYrNk4rOXFJd0lja1JvTGJGNDRH?=
 =?utf-8?B?ekZuMlpuaUtENngrSzBKT3hWTHA2RVRZL3VrcHlYajZob1RvTUFvdDlySjVn?=
 =?utf-8?B?bHB5eWpsUWNWc0JXVUQzS1lCTkdwNGhEMVhodStQeFJIT3AzdzRBbExLNlJL?=
 =?utf-8?B?QTAzV3k0TE02QktPME0rUExiZlRQUm5lZXVjQ1V4ZTYzS3VvWWVOV0ZVcnFl?=
 =?utf-8?B?Z3l6QUFOb1lsUXJZRjVPaitzS1dmYzlZVFk2elpJV2RzLzdMemdMaUxmd0w1?=
 =?utf-8?B?czkybC9vRVcvUXRva1draG1JZUdwQnFlYVZMU1RpQkw1U2svaVhFVDJjUFdz?=
 =?utf-8?B?SUpyWlViOWd4a21TSzliTmZ3amlRWE45UkllL2ZTSHVwQ0ZZZ2IvMU9BMnY5?=
 =?utf-8?B?SjljR1F3UVJtVEVBMnp4dmYzTWF2U25GQVI4TUozckRZWmkwdTZrdlRDYWU0?=
 =?utf-8?B?UDBEaGRzaVhSR1NPSzRqOUt4aTAwOG04elRQSVhtekpsMm9NWlRpNjNxdVNJ?=
 =?utf-8?B?bURGb1QrbnVjd0I0WFlsMmQ3ajRqOURiVkV3YzZ1VzR5NmtEK1NJUHM0Uldw?=
 =?utf-8?Q?hICRVMa8TNmF4T7w7L0iKnHsw?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2293a19-f297-4dd5-dbb5-08db5882664c
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 May 2023 16:02:08.7915
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0ctwQvC7DBz3aE3f5Edd4Y385QrTJSzExtI1wGgseBf+YsnH3jwa7H4vIOlAAEcQkQvn+I9jGrViUM/S6ZZzWpIrNtNnpTld4FjhClEAIng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11431
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
UEFUQ0ggdjQgMDMvMTFdIGR0LWJpbmRpbmdzOiBydGM6IGlzaWwsaXNsMTIwODogRG9jdW1lbnQN
Cj4gY2xvY2sgYW5kIGNsb2NrLW5hbWVzIHByb3BlcnRpZXMNCj4gDQo+IEhpIEJpanUsDQo+IA0K
PiBPbiBUaHUsIE1heSAxOCwgMjAyMyBhdCAxOjM34oCvUE0gQmlqdSBEYXMgPGJpanUuZGFzLmp6
QGJwLnJlbmVzYXMuY29tPg0KPiB3cm90ZToNCj4gPiBBcyBwZXIgdGhlIEhXIG1hbnVhbCwgWFRP
U0NCIGJpdCBzZXR0aW5nIGlzIGFzIGZvbGxvd3MNCj4gPg0KPiA+IElmIHVzaW5nIGFuIGV4dGVy
bmFsIGNsb2NrIHNpZ25hbCwgc2V0IHRoZSBYVE9TQ0IgYml0IGFzIDEgdG8gZGlzYWJsZQ0KPiA+
IHRoZSBjcnlzdGFsIG9zY2lsbGF0b3IuDQo+ID4NCj4gPiBJZiB1c2luZyBhbiBleHRlcm5hbCBj
cnlzdGFsLCB0aGUgWFRPU0NCIGJpdCBuZWVkcyB0byBiZSBzZXQgYXQgMCB0bw0KPiA+IGVuYWJs
ZSB0aGUgY3J5c3RhbCBvc2NpbGxhdG9yLg0KPiA+DQo+ID4gRG9jdW1lbnQgY2xvY2sgYW5kIGNs
b2NrLW5hbWVzIHByb3BlcnRpZXMuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjQ6DQo+ID4gICogTmV3
IHBhdGNoDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcGF0Y2ghDQo+IA0KPiA+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ydGMvaXNpbCxpc2wxMjA4LnlhbWwNCj4gPiAr
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcnRjL2lzaWwsaXNsMTIwOC55
YW1sDQo+ID4gQEAgLTI1LDYgKzI1LDE5IEBAIHByb3BlcnRpZXM6DQo+ID4gICAgcmVnOg0KPiA+
ICAgICAgbWF4SXRlbXM6IDENCj4gPg0KPiA+ICsgIGNsb2NrczoNCj4gPiArICAgIG1heEl0ZW1z
OiAxDQo+ID4gKw0KPiA+ICsgIGNsb2NrLW5hbWVzOg0KPiA+ICsgICAgZGVzY3JpcHRpb246IHwN
Cj4gPiArICAgICAgVXNlIHhpbiwgaWYgY29ubmVjdGVkIHRvIGFuIGV4dGVybmFsIGNyeXN0YWwu
DQo+ID4gKyAgICAgIFVzZSBjbGtpbiwgaWYgY29ubmVjdGVkIHRvIGFuIGV4dGVybmFsIGNsb2Nr
IHNpZ25hbC4NCj4gPiArICAgIG9uZU9mOg0KPiA+ICsgICAgICAtIGl0ZW1zOg0KPiA+ICsgICAg
ICAgICAgLSBjb25zdDogeGluDQo+ID4gKyAgICAgIC0gaXRlbXM6DQo+ID4gKyAgICAgICAgICAt
IGNvbnN0OiBjbGtpbg0KPiA+ICsNCj4gDQo+IEkgZ3Vlc3MgdGhhdCBvbmVPZiBzY2hlbWUgaXMg
ZXF1aXZhbGVudCB0byB0aGUgc2ltcGxlcg0KPiANCj4gICAgIGVudW06DQo+ICAgICAgIC0geGlu
DQo+ICAgICAgIC0gY2xraW4NCg0KQWdyZWVkLg0KDQpDaGVlcnMsDQpCaWp1DQo=
