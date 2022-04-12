Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53F494FE0A6
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Apr 2022 14:45:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353573AbiDLMmO (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Apr 2022 08:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353447AbiDLMlD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Apr 2022 08:41:03 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF9E5201BF;
        Tue, 12 Apr 2022 05:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649765108; x=1681301108;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=rHt4cdvDDKzeG1+u2heG1t1MO+Mw3dRiN6x5lM/WOBo=;
  b=uZLpdS/f4yajFBH5RRgDF0/PvFjn1Og+ikdqJXqd8IKpygD4LQ5/RIhL
   9iktmtmE0hlklw8kBPOxO1hbbx77dhmZmSj3rn0Auufdfu/sZ/83wpzch
   jch1PMNN2Zlj5bn0xKD18YFjBNBhWA4qlYpordxui1p5g4IxvRwap7lCU
   oGiebd2TeBpf1vxTvnG1HCnHKWEfhl2tuQ8fx/I03IrU9n2YboVfq5aas
   sxsxtWAD64/c+k1gRF+kHcWEUUOIuZ6p1HzjZX3BWX/gQjSmD/Re+J4jU
   Q6Tg4yPKg19Y0C8riWoLccXH5+L5FFEXDWJJJa+Rzm8VQG72iv0EvIiYN
   A==;
X-IronPort-AV: E=Sophos;i="5.90,253,1643698800"; 
   d="scan'208";a="155273944"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Apr 2022 05:05:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 12 Apr 2022 05:05:06 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 12 Apr 2022 05:05:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KtmdXjSaP0ipMb4zFb+l6ZM2PrT6prWZaVpsKxp9DPdGI/cC25k4gvp2K/84W3pjfP2BSSDqOADMpBnza6OFul7Kt+5LZJUb+j7zR45i9o0u2chSrEZ346DtSefHusE+vQz7ZF9o4b1OvgbDcZPaX+oC8h+QQlxiYPaXfyKNL0q/bFM6+09OAvcmIR3MDDFIyPwO7X+WGWaQTTLDLPMDMZGaxgxuI/+JdwieNqfnzpHQqQkEPT+CjJQBcT6WVkG9ExRmirvc5+ZsvshH+/witH9gIS+OJu18ouAJphPAQdzCvGVa8AVUn00Nz5Asd9tKZSo8T47ZDM01uFS3aTKAHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rHt4cdvDDKzeG1+u2heG1t1MO+Mw3dRiN6x5lM/WOBo=;
 b=AlstpWTLOsDy3h4xAH/JcLajkZM6bni/O2UrUbEMPvL2aEUEQg43VL/U3kaXmkDyvaOPqM7AFEAidZMIpWi4X0bEVatZLnNQExVLQn/bydSdmAXbafHRDFjRIfURN8dCEodS2/zbdk4UkHeW+CnyHzx31UOr4qMKOPoXFLnDCS/Ch3qQ9xw9hk3m67uJS21J622vOCoV2togdPQYzY+VNODlg0GG9jDzdg1vhptcANXzfTXaVNGsE+MQe9Z+lAzvlTMhhOfOW+Ahltt0Hc4TPtT087P/8ROhOHdcxdf2nZpfeFiatnzu37677kPEd6Ioh+atw53pD9e31+ameOER0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rHt4cdvDDKzeG1+u2heG1t1MO+Mw3dRiN6x5lM/WOBo=;
 b=tRyNDmYPbAgojSOxMIX3srEekmcTErkSh4qYb/Zyg9jY2VBE7ZrbquonQW84ehfJgu43IYPcLPv9nfzb3jYKs9F1BLshdBXqX+PqP+D+GvAuSC2dJViN2NcZgvnmXPZo9Sw6tp/qYrzyUkCwDsZ+PSEDUc4cSNL5g568fFupGRY=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by BY5PR11MB4038.namprd11.prod.outlook.com (2603:10b6:a03:18c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Tue, 12 Apr
 2022 12:04:55 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220%8]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 12:04:55 +0000
From:   <Conor.Dooley@microchip.com>
To:     <krzysztof.kozlowski@linaro.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
        <paul.walmsley@sifive.com>, <palmer@rivosinc.com>,
        <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
        <robh+dt@kernel.org>, <krzk+dt@kernel.org>
CC:     <Daire.McNamara@microchip.com>, <linux-rtc@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 5/9] dt-bindings: clk: mpfs: add defines for two new
 clocks
Thread-Topic: [PATCH v2 5/9] dt-bindings: clk: mpfs: add defines for two new
 clocks
Thread-Index: AQHYTYKslABeLE5gO0q5nkv48GN1+azsKxIAgAAE2YA=
Date:   Tue, 12 Apr 2022 12:04:55 +0000
Message-ID: <2e1b0207-dfb3-4cc5-d306-d2b0c6ed8cfd@microchip.com>
References: <20220411085916.941433-1-conor.dooley@microchip.com>
 <20220411085916.941433-6-conor.dooley@microchip.com>
 <d49f38e7-5fd9-4e9a-cc20-2c839eb53712@linaro.org>
In-Reply-To: <d49f38e7-5fd9-4e9a-cc20-2c839eb53712@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c817f0e9-fb2b-4301-76ef-08da1c7ca881
x-ms-traffictypediagnostic: BY5PR11MB4038:EE_
x-microsoft-antispam-prvs: <BY5PR11MB40388EB1850C30B70236E39398ED9@BY5PR11MB4038.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4mPbrlGEb5otdd9wEfDjXsxjBs2nq85p7zyTYDDkJ/hqhQFW9Vkaz5k2yNISthZg21sVQU7vOSy0ji/nB2Fr2pABmzs2ebr2hmgolAH6woUQ62DvMbRwAvukPP80/kx73kZQWGxSiH6cdpKoYWKmX1KPWwG1W64KCx44BAjdqgAyHz3TmB34HHfe1o5phB57mwxwPQNQdO6DhF78XpPdeVK209w9PnioZOzJRGr/tISLFkNhe6QThIuIw8moTpz1kUd7l0nz3vCbHIy0MOqIbz7JIeHGJjRLx1aAamL+AF2ogmLkZnZYI/kWZp5QwDAwXCIF5927m9+iUaM3O2TOQhE8yM0cAsVB3bUB6dBFR+9QqzV37pC6EBAjYhmM+F6kJae31S6FqVtRHs0RtMAqVGfWNhUrkNWKAhf3cOKd/Y7x/nsRqeoIThQA0S2DRdXto/PAGYyaALaJXs2QNjsfzse0XycuyHNQBtukG5NISlO68Z65KugnwHExStA9NMEyXr5zKLiGsaIc+E9Ly3R9BRQNHF1cUyFRYBlOh3E9L7RTczfsX+iSKCcioJUZj6Xt5haPTKfU8ulFxFi56HjgZOY2NnF//O7khBpSwoAOYL3M7ywBS7GCV5HW1mZ7pTFpYX5vMUcsH67+xkm64OvBr/Fr4g7IaSJal993l4nbYLjkA9pvRSKP7qbblBfwwmoxjrvGRxSHMgcRsyvCg7uNBXdV0Cv49QvH2+8EzrPmXA4rvTlRH//sdKhRZSlcoBioxdBVv0CBBE70em0j0++FnuXiddeLDGUdvOiNz9/vx9jtdG3oSC4M6FNnP4qNpY/y
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(83380400001)(508600001)(91956017)(6486002)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(71200400001)(110136005)(4326008)(26005)(2906002)(2616005)(186003)(53546011)(6506007)(54906003)(6512007)(36756003)(38070700005)(7416002)(316002)(31686004)(86362001)(31696002)(8936002)(5660300002)(38100700002)(122000001)(921005)(87944003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b1Y2Vk1wRWM5ektFNVZERXNNRFppM014SUVVamRLNitjWFNGd25PNnhPRFBF?=
 =?utf-8?B?dEE2YW1BRWtQb1JvNlk2cmc3RWkzenlFREp1ZFlrMGE4V2tqSUR1cEltSnVZ?=
 =?utf-8?B?MFYydFFJTTQvVThvU3k3QVdocFZ4alUwZnpNTkRBR01OZ2JFWVVDaDhhRVp2?=
 =?utf-8?B?VWROTThqUDZ2UWJmdVhKclduSmNtU1NOWk5GeUpIa1ZXQ2d6WXVYVUgya0k3?=
 =?utf-8?B?ekwyY3dJNGQrS1ROZGNtK2w4OTNyWGlObXZDdUZuTnZJc3dDcy95RUR1SmNr?=
 =?utf-8?B?WVBwQmtKZ1pHdE5KUXl1VzlZVHBra3IxckxLZk5IVURwR3A2L09WQXczemx1?=
 =?utf-8?B?aXJsVENnMlFOL0xRU09acFhzc3J1ZU1ud0hCa0ZrTnRZQVB0SnlKL0dka1k4?=
 =?utf-8?B?N0xTY3Ewb21rYjR5cXVRQlA5cFMvZ3dOc0hPNnQxazdKWUZraGFqeGVMY2dD?=
 =?utf-8?B?blhBUXJTZDVKaEV1R3pXeFdVWFd3dm5wZmFIaVNCdnU2ZDB6TmRDSi9IUHVC?=
 =?utf-8?B?dzhBY1djNFhIZkgwN0ZjRkpVZ29VRVNJRlYrQ2J2YVFwdEZNZ0hBZnIxdTRB?=
 =?utf-8?B?RWUyQXVRbmc0NWduTUpNcmx1WS9Kb2IxaUdyWEhISDZTOC9hNjBXRjJFWFRU?=
 =?utf-8?B?MXhMS1A2Q2dKRXBMbEJBL2piblhldm50OUVSMzlyd3ZPMGlmSXNjU3FBVVRH?=
 =?utf-8?B?UWF2bkhTNFdZS0FqODJFWjM5czJyTlAvbG9ZYmk3WHEwOVJJOWE3a05QcWRZ?=
 =?utf-8?B?THZMQU1LRXJrYitZUUc5UkVpN1JPTm00L1RBekx0RENBUkRyZWFrU0NGV3Jv?=
 =?utf-8?B?WmFzRitVYmNhRmQ2ajQ5TmFhRjRkbEM3WG9zelBBRU9QN2NmdEJZZSthbGZI?=
 =?utf-8?B?TjYzNFdtaE1pT2xDYlVDRVhGeTVKK3N0STlKRXhrWmN3ZlNTZzk2Yk1wVmxp?=
 =?utf-8?B?TFdoWGhlN2I1TUZWb01MdjhJY2Z5Z0RZYkI2ejFUeGFHS3dBcUZWc1lYZ3M2?=
 =?utf-8?B?UFNZV045MUE4eDlCbnNaUW1mRy9xci9oM3RoRzVieVFtL041QlN4S0h2Mjd6?=
 =?utf-8?B?SzNQRnE3ck1FVjdkaGk0UEJoT1BxTW16SmpSV0NkUFFPT0dDeEE2ZWl5eHVu?=
 =?utf-8?B?eUJkdjRHemg1QjZxa1JiOEVKR1FkczFHb0hGc0dxRnc1cHQwekcxNWh5eENM?=
 =?utf-8?B?czBQMEtDaXJNdFhDQ3VNYW1zRWMxZjlsdjU1dUlxYTc3QU1ETkkvZlZhVHhJ?=
 =?utf-8?B?RFFJUnJrb1J5SVgxd04reDFlTWM4M0o3VTMvTk5hR0VuclZGY0dIdi9qQkU1?=
 =?utf-8?B?LzhCa3lldEFsTy9PdWUxblJMSk9iNFJBMUVPUHJTMFZpcW9GNytjUitqQ0pY?=
 =?utf-8?B?dUdBWWl3ai8renIycXl5YTVuME4rT09wemMwSVJKYUc2TTFRb0xVTjlqTzd3?=
 =?utf-8?B?T1Z0WnJHZ0J4SHJEbFRXc2w4dy9pVUxpYVVraWpGZzByZDFadURyNVR1NEhK?=
 =?utf-8?B?ZHNOMVZrMWlRZ3JxYW91SWNYaXBGcDZ6RVA5dDZPRG0vVFVKQ29SS2dZRnBu?=
 =?utf-8?B?RitmMTQ3QTR4NVp5Ris5b2hrNVlhU2Vvd1pOdmpNLzA5SkhIeDV2U2RpaVpq?=
 =?utf-8?B?OFB4L0E5bDVET2h3ZldQMi9oVnhaUDZwUnVacTAyekJ1N2FSaDlSUFQrNnRX?=
 =?utf-8?B?OXB2TUwxYlhHcGxFbjRKMnRKNzcveTFnMU94cERGaXhHOFZlbEtaRjh1TnRq?=
 =?utf-8?B?K1A5MXJ5WFNFQ1U1enpLNDdXRlV1MldtMW1zYjBWMFkwL3Y0Szg0NndjSTdr?=
 =?utf-8?B?c2NFSXI3Q2R0Nkh6emV6ancyQkFEK0llbEl2UG0rME5YbmVncTM4MmcybGJT?=
 =?utf-8?B?NkRvbTlCQU5DTjBhUi9RUUtENnh3cWFtWTM5VHZOTytselhIZFZsS0FWZTJ2?=
 =?utf-8?B?VkpDUThoR2JsNks4dHd1QlVMYWpURGVKaVBZVjl1RmlnbS9KalNENzMrMEJQ?=
 =?utf-8?B?NlRwbENUZDRxSksxenl1b2RuZTBCdXNQQ21uc0U2bUFpcDkrQTI5OW5lQytM?=
 =?utf-8?B?YTVZMnRKdkxZblVHZk5NWXdKcWYyeXJLOGtqMUdib0NkbW1Kb0RqcEIvbmxr?=
 =?utf-8?B?dUdZSkRQbnByR3hQa3gzRWxKSDl6aHlqTEpnTytxejVQbjdWU3JWcEJkNGxx?=
 =?utf-8?B?dFJ6cUpXSWxEQUwzZFBPcnFjeFJzK2hpTEQ1cmw0QmxPWjZvQ1lTZlBtdG5h?=
 =?utf-8?B?VE1kY2tFamsxd1FpZmgzeDZGRFZqb0t2S3E2UGY3WitYWnRxdGhwSkh5RE5Y?=
 =?utf-8?B?OUROaG9yejAyTEFqZHpmNnpYRXRuaFZ2dVM0cjZscWNZK2ZmVkQ3UT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C2DC91599728FC4E923C260C3BE23FA8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c817f0e9-fb2b-4301-76ef-08da1c7ca881
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 12:04:55.3676
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p6PZp2y2myQnlyx2CprAYgCRQ9O4YlYIz2C1xChwLvgqqk2jSBdRhM8PyCs/ztY7Tiil/7DSuMrjb7sNhTAYtfiQHt413B+0XQJ0gRu+SDs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4038
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gMTIvMDQvMjAyMiAxMTo0NywgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAxMS8wNC8yMDIyIDEwOjU5LCBD
b25vciBEb29sZXkgd3JvdGU6DQo+PiBUaGUgUlRDIHJlZmVyZW5jZSBhbmQgTVNTUExMIHdlcmUg
cHJldmlvdXNseSBub3QgZG9jdW1lbnRlZCBvciBkZWZpbmVkLA0KPj4gYXMgdGhleSB3ZXJlIHVu
dXNlZC4gQWRkIHRoZWlyIGRlZmluZXMgdG8gdGhlIFBvbGFyRmlyZSBTb0MgaGVhZGVyLg0KPj4N
Cj4+IEZpeGVzOiAyMTQ1YmI2ODdlM2YgKCJkdC1iaW5kaW5nczogY2xrOiBtaWNyb2NoaXA6IEFk
ZCBNaWNyb2NoaXAgUG9sYXJGaXJlIGhvc3QgYmluZGluZyIpDQo+PiBSZXZpZXdlZC1ieTogRGFp
cmUgTWNOYW1hcmEgPGRhaXJlLm1jbmFtYXJhQG1pY3JvY2hpcC5jb20+DQo+PiBTaWduZWQtb2Zm
LWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+
PiAgIGluY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svbWljcm9jaGlwLG1wZnMtY2xvY2suaCB8IDUg
KysrKy0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigt
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL21pY3JvY2hp
cCxtcGZzLWNsb2NrLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL21pY3JvY2hpcCxtcGZz
LWNsb2NrLmgNCj4+IGluZGV4IDczZjJhOTMyNDg1Ny4uM2NiYTQ2YjkxOTFmIDEwMDY0NA0KPj4g
LS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9taWNyb2NoaXAsbXBmcy1jbG9jay5oDQo+
PiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL21pY3JvY2hpcCxtcGZzLWNsb2NrLmgN
Cj4+IEBAIC0xLDE1ICsxLDE4IEBADQo+PiAgIC8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAo
R1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkgKi8NCj4+ICAgLyoNCj4+ICAgICogRGFpcmUg
TWNOYW1hcmEsPGRhaXJlLm1jbmFtYXJhQG1pY3JvY2hpcC5jb20+DQo+PiAtICogQ29weXJpZ2h0
IChDKSAyMDIwIE1pY3JvY2hpcCBUZWNobm9sb2d5IEluYy4gIEFsbCByaWdodHMgcmVzZXJ2ZWQu
DQo+PiArICogQ29weXJpZ2h0IChDKSAyMDIwLTIwMjIgTWljcm9jaGlwIFRlY2hub2xvZ3kgSW5j
LiAgQWxsIHJpZ2h0cyByZXNlcnZlZC4NCj4+ICAgICovDQo+Pg0KPj4gICAjaWZuZGVmIF9EVF9C
SU5ESU5HU19DTEtfTUlDUk9DSElQX01QRlNfSF8NCj4+ICAgI2RlZmluZSBfRFRfQklORElOR1Nf
Q0xLX01JQ1JPQ0hJUF9NUEZTX0hfDQo+Pg0KPj4gKyNkZWZpbmUgQ0xLX01TU1BMTCAgIDM0DQo+
IA0KPiBZb3UgaGF2ZSBzb21lIHdlaXJkIG9yZGVyIGhlcmUuIFNob3VsZG4ndCBpdCBiZSB1bmRl
ciBDTEtfUlRDUkVGPw0KDQpZZWFoIG51bWVyaWNhbGx5IHdlaXJkbHkgb3JkZXJlZCAtIEkgZ3Jv
dXBlZCB0aGUgY2xvY2tzIGJ5IHR5cGU6DQpNU1NQTEwgaXMgYSBwbGwsIENQVS9BWEkvQUhCL1JU
QyBhcmUgYWxsIGRpdmlkZXJzICYgdGhlIHJlc3QgYXJlIG9uL29mZg0KdG9nZ2xlcy4gSSdkJ3Zl
IHByZWZlcmVkIHRvIGhhdmUgcmVudW1iZXJlZCB0aGUgd2hvbGUgbGlzdCwgYnV0IHRoYXQNCmRp
ZG4ndCBmZWVsIGxpa2UgYSBnb29kIGlkZWEuDQoNCkFkZGl0aW9uYWxseSBNU1NQTEwgaXMgdGhl
IHNvdXJjZSBmb3IgQ0xLX3tDUEksQVhJLEFIQn0gc28gSSBwdXQgaXQgYXQNCnRoZSB0b3AuIEkg
aGF2ZSBubyBwYXJ0aWN1bGFyIHByZWZlcmVuY2UsIHNvIGlmIHlvdSB3YW50IHRoZW0gcmVvcmRl
cmVkDQpzbyB0aGF0IE1TU1BMTCBpcyB1bmRlciBSVENSRUYganVzdCBzYXkgdGhlIHdvcmQgOikN
Cg0KVGhhbmtzLA0KQ29ub3IuDQoNCj4gDQo+PiArDQo+PiAgICNkZWZpbmUgQ0xLX0NQVSAgICAg
ICAgICAgICAgMA0KPj4gICAjZGVmaW5lIENMS19BWEkgICAgICAgICAgICAgIDENCj4+ICAgI2Rl
ZmluZSBDTEtfQUhCICAgICAgICAgICAgICAyDQo+PiArI2RlZmluZSBDTEtfUlRDUkVGICAgMzMN
Cj4+DQo+PiAgICNkZWZpbmUgQ0xLX0VOVk0gICAgIDMNCj4+ICAgI2RlZmluZSBDTEtfTUFDMCAg
ICAgNA0KPiANCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQoNCg==
