Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C26334FE133
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Apr 2022 14:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354731AbiDLMzE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 12 Apr 2022 08:55:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355261AbiDLMxz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 12 Apr 2022 08:53:55 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D100CFA;
        Tue, 12 Apr 2022 05:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1649766393; x=1681302393;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=hA8rpGkMFdEJU3cGq4hSizCsf3y+zOUCMScAdW1aImw=;
  b=AiDLt8qRlrkDCI0w2JqXaBVKagB+W2/veH+JLVPI24SvVU1ECcInlYIe
   BdhwTBMAQVUL75FycAI5DtwY9hFrsUHQ4mh/2MfyVGBP4QBG7xkM0NWu5
   HwyXLBzLEn43muh2zCkq092H1giM9vOK6xR6UbDf+8Clfb4WgicFbJgKY
   VQGctF2x3muYGQm+6bK5IoCzRc0UzYCe7v4yhjcYfFxyVyz8ezZgN/KIU
   kB2/LfX7cipsy0k72GxtV/3pe0xGUQLj5tnWlNNQoE8LBiog7Yy4iWcij
   1LAdeuzrw9VR5UAqpSRBN/QWp6WHH+yJqscTaFDJjUVpXtpdy8gaxxWJm
   A==;
X-IronPort-AV: E=Sophos;i="5.90,253,1643698800"; 
   d="scan'208";a="169343840"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Apr 2022 05:26:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 12 Apr 2022 05:26:31 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17 via Frontend Transport; Tue, 12 Apr 2022 05:26:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5qmZrcEka0uO5xHrSMr0qpu6tJseRQoKGn+c+J02i/q5jbN1+CUdcHZiiDQhtjKkWb2cKd2EhO7Q0dMrohgup37moml4N5jQHdc8VAJIg3jlDaAdI2NJW82MJXPgmZmenI922ZTyUKHKFo4kkXjW7NUcvJRFBkjMUL0Mkh1a5u10gDsvW981fsM4oRXyQInwZzRGi9keAaPs74RMT+J6ld2SauK+D0qcARE1zCtz1kH3FF7w4eRNblY1zGeX5MzWbG1Gui1PSmYOzUNebtAOVjjzAe7X04j0DZxQd65ijfZYDqUxm696bzegUqI7xsKIu0fQntfkkUb1m8pYlmDPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hA8rpGkMFdEJU3cGq4hSizCsf3y+zOUCMScAdW1aImw=;
 b=kwC6SxbzLhYs0oEwolI20PIby9Z1V335kbhbWNlu4BnQ0AS+bet+i0DmcxugRZjEVuua+8G8TdoTCEyF2qXlKjZtETfD8g9gfsI6FhfIc0INxWK21GJDS0p85uGMyPgxb13ibDP3VcTTpB7Bz0tMzVvtLK5RoefbZWbPxTvCpDL3RkhIAksG2YLebbMqLBtRyn7duJ6Co3Z87cOTKpnFxeVbbbzygA+Lhml0KrpcmO+B4FA1Lng6PUVCBk2EpuEkBAqoogSQjBNcmTwckVhuduZwIOX3NLmOU9XCm8T26g8H9AAe2K32d4h7t8YJ+AojsuopikM2Ra+fjC60+RAqHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hA8rpGkMFdEJU3cGq4hSizCsf3y+zOUCMScAdW1aImw=;
 b=rYiZ2o/Gha031imXwqR+n+LGgkXC4pRemoHS407jmKkEQgKFtYvJNyfaOWoMxDvu6AwPgepFUYmGGGNyR2rNA4Tpyq9NhrMlZ3yD/A/C/AOFSM0r1kI3eKSfsh6rvxv33RTfnatIFwuy+Jfvu0JLn/EMA+wY1komdBso7zH4PQo=
Received: from CO1PR11MB5154.namprd11.prod.outlook.com (2603:10b6:303:95::7)
 by DM6PR11MB3035.namprd11.prod.outlook.com (2603:10b6:5:69::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Tue, 12 Apr
 2022 12:26:26 +0000
Received: from CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220]) by CO1PR11MB5154.namprd11.prod.outlook.com
 ([fe80::dc95:437b:6564:f220%8]) with mapi id 15.20.5144.029; Tue, 12 Apr 2022
 12:26:26 +0000
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
Thread-Index: AQHYTYKslABeLE5gO0q5nkv48GN1+azsKxIAgAAE2YCAAAGbgIAABGeA
Date:   Tue, 12 Apr 2022 12:26:25 +0000
Message-ID: <74695e55-0b59-9236-be19-b02060ad4177@microchip.com>
References: <20220411085916.941433-1-conor.dooley@microchip.com>
 <20220411085916.941433-6-conor.dooley@microchip.com>
 <d49f38e7-5fd9-4e9a-cc20-2c839eb53712@linaro.org>
 <2e1b0207-dfb3-4cc5-d306-d2b0c6ed8cfd@microchip.com>
 <25feb189-4d97-f9b1-518e-69aae9a274e0@linaro.org>
In-Reply-To: <25feb189-4d97-f9b1-518e-69aae9a274e0@linaro.org>
Accept-Language: en-IE, en-US
Content-Language: en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f1885032-f410-4148-bd11-08da1c7fa9d3
x-ms-traffictypediagnostic: DM6PR11MB3035:EE_
x-microsoft-antispam-prvs: <DM6PR11MB303588A9762C6FD02AC8A59298ED9@DM6PR11MB3035.namprd11.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EsgMI98O5ohhcIzJ39R0zzLX/JhyNER8ZmU14npNA8YWq84ZoPunlVmo7sfH2Wcai70xU7t6Ltp2Cn3D4FqgxZT4fLJVafhZY7E3Seea0mZ5uW/wVj3ST9hvDSizS57DUJIgmEoF2JLkUCcezBabMEtwvWvRMZQV9uDlkvvAF1nGHu2jZOkQZwR4l6ZMFglVFJOSfS3/HOi33D4wYIXhHYxZtUigXZLs9PR+ZWSvMeQB96DxLPCI2SoesdV1pCp5FmAqD/SipydyeiZCMyzNMIImvOEbPePP/j/l5rBScK74J/l5Pwdd6i+SbnOCPILUUQSRFc0RrX19/2+pTMkZWPahd+rdB0yNdEbiZfxkztfcnjDXGcMkSlhHSvXTkEPwhoyfdYCFn8jBG9KwoHIMYhq+dWh5X05dQcRhhQgJjoZRdx+f7I7catpVb7y6RuutE0SxSpySEyJ3eE3JTQpswpF78BgZetXBRsc8NiAZohQNEigxMkNEocEXBeqSvfQ09lQbgq2b0a0Pl05eK6G3PZHK+XgE0xzab5TlF4gV6rwAIuVrHbsMIWYZP7Ydr6ny/WWDDy/MUzPiwLS7LkzF40lKT/vwSgO16mTAKg1AMKO43eS3gpC5kgxMCEPWPjRcSy7qeZUSbJFLt0Ug18pSxN244XB37O1sGbL/UvAFCVJlSSkxTC3NdnbXoFUnOD6D+Zfg+pxHzDLKbz11hfnv160kFf7reMHO44Vasq3oksV2MTzP/ray0/dU2Y67XopiW5hZdi/dZqEIWgsOsS/qmTrabNWrkAu11eaBKM5cpPyEp9Jo1mZMi802oHvrpfNt
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5154.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6512007)(54906003)(8936002)(5660300002)(26005)(4326008)(6506007)(2616005)(53546011)(36756003)(66476007)(8676002)(66446008)(64756008)(66556008)(76116006)(66946007)(91956017)(508600001)(83380400001)(2906002)(7416002)(110136005)(31686004)(6486002)(186003)(38070700005)(38100700002)(316002)(122000001)(31696002)(921005)(71200400001)(86362001)(87944003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEZlMDI1NWh3OFVTOEJaNHhXazd5U1RXRW5OUVUxTlhrcUpTT2dwczZNY2ZT?=
 =?utf-8?B?NG1NQnZRam4rUElZcmtZM3NkdWV2cXRlcGZENHE4bU9CM3phTDN5aUZJTXlM?=
 =?utf-8?B?cjFJWFRnb3UxM3I0TnVCQy9jU0FkM3kwT2xFZmpkNTFBM2hmQUZxSWpYZXNJ?=
 =?utf-8?B?VTFaNElqaVRHSzlrUUlvS1BQaE81T1RaTmlxN1J3MWRuZjhVQnZoeDczTVM3?=
 =?utf-8?B?bDdpWlhPZ254Mk9YdEFwUEVkTHhEVXpNWGRQRWVXZWJpNTQ3Vlc2UDZTM1A3?=
 =?utf-8?B?WHZXNGlCdWRuZDRjWWozemNuVWs5RFpPZmRGUzluTzFJckkwSlp2dlQ1Zkk0?=
 =?utf-8?B?ZW1QWlYrSVVOTlM2UGZ4N2VURHM4V1lwZlB0NXFHMC80NkZLWDVyMVZGQXVO?=
 =?utf-8?B?d2RXTkFpSFlxKzF1RmpqWmR3a1dGSTlLRFF2SUFMS3lTbUdwVmNwaWlKNk0r?=
 =?utf-8?B?Y3p0YkxCUlFNOXBlRWRQQ0hIVjdjbUcwODBJTDZPdzZ1dEdYUlZTUXRsdkF0?=
 =?utf-8?B?OWoyTWZxdVlLOFpZVW4yZm82ZHU1T2xZZTBrelh3ZHFBNE0vTGNVNC9Kb2ly?=
 =?utf-8?B?ejBtNkdxbnVrVTZXdlV6dE1zQ0RhR0pnVlMzOCt4QVQwTWEzUVoxNXNwSm4r?=
 =?utf-8?B?Rnh6THNXeW9pZWhwdlA0L0FKTE1kZUR5eDAzQ0Ewb3BEZS83cUsreHJnVTRK?=
 =?utf-8?B?WEwrdnZ2MEprYURpZU0vMVVWUVZVcDQwK3M4Y056b1NIMWtZUGFyZlNYY3l0?=
 =?utf-8?B?M2JDWXlhcERKaExQbDNrVmxxMXNvODJhS08xVmREQXNSc2tpWGxMWEVqcVpw?=
 =?utf-8?B?SkVwREJ1eEpIUmwyeUFVZ0MwT09leW9hazlLKzZ3MEhzZE9xZjB3dSt5RUlI?=
 =?utf-8?B?ZXk0dzZSbDFkdGNtS0RhRmx6bkNjSDhnQVJ0c3RXMXdJaUNsaDVEQ0FjSTVG?=
 =?utf-8?B?OVU4bEFMLytqTm92Nm14OXRiYmUyRlh5aVZGRzJONkU1YVRwM2JJTm5BbGVm?=
 =?utf-8?B?VE9LcmEwVVhCK2p1U0J2a29hSnFvQ1BUeWpLR2Z3cDZqek1kVk1OZk9iNlor?=
 =?utf-8?B?M0VkV3FnVnRVUm9zN05mTVloWkJFa3JWNGpvVlZmbm15OHdCa1puaGZ5YzNi?=
 =?utf-8?B?Sk8yVThuSm1Yejg5UmJHZ1hLbnJqalNYODFMMDd2dTZjRWo1SnVrZXVyMVF4?=
 =?utf-8?B?MEZkemZuTWlXLysweXRId0RvdkkycDR0WDZsUUZ2YTBwNjRYa0dLWHd1RjRE?=
 =?utf-8?B?bmNmVmQ5YTRYeTJRa1ZhQWljZ1RFdEpSU016d1JlcHJxQVFuejRiNHhoZTdl?=
 =?utf-8?B?UEtFOHBZbVMzNFZ4ZVN1aWd6VFpyRG5pTVlvSVI1MUxkZDJjbHlrMmVlR2hI?=
 =?utf-8?B?Z25acnpuZnZPanlZRUR4TkhPc2tPdEdOQlYxZXovRDNLY3R4MysvMGRWbEIv?=
 =?utf-8?B?Zk9BdHZhKzgxT3FXUGNaell3R1RVRzNpditvR0RJWjJwVFpXOGRmZk5vcWt0?=
 =?utf-8?B?VHVrTTJraGhzVmpydzY1WGFvdUV2K2lTVWRQRzNuVUhIeDI2WjJwTXdETHdq?=
 =?utf-8?B?dGFuRHExamQ4d0tWRHJvQ0VTL0lGSFNjYzVuNzkwRmhpZ3k2dVc3MDZqNk53?=
 =?utf-8?B?NGdJalB3Q1lkcnAxb1EvQkx6S0dvRzA2ajl0MytyeENDQWZ5blhMVTlLbjJB?=
 =?utf-8?B?TGJsNWpmanZtSDhvU3ZTcTlmSTllbnVsUGxCc25aTmxzZW5IVjBURDRoeTNz?=
 =?utf-8?B?V3ZFZU1RU0dnTGJtc0MvaUFxRnUwWlpmdSsxcFMyR3hrbU9TbnQyVkdUYkVL?=
 =?utf-8?B?bEI1dXdlOUV3QkV0MVZGaGpsTjNvRG1mdkowQmIrSytOQ01HNGMzL0hrSm14?=
 =?utf-8?B?b09ua2lZN2NXZFJBeFAxQUFzZGZrSFhQbUZ2TmVRQnNUbjVPcklzdzlLU1dW?=
 =?utf-8?B?VkhuMUN6cEpETTA3cS85dzNKcXUyR1dSSUFEMWN4aktucG4wZkNGd2ZwSnhs?=
 =?utf-8?B?ejNwM2pIV2VmSzBuNmptV2hnZlJYbnFKMTdYek5vNTdGVkJwdFpYRHFQejZ2?=
 =?utf-8?B?TDdWQVFMNlFsVjRnZ21ZQS9Gd1F2ZmwrbTR5amNncDU4ZDdFUlZqU0xCV0M5?=
 =?utf-8?B?RUJPMG9KeCt0eURrUWY2NzJINkd5VzNjRDJkRzAvMFpHL2U4Qi9BN1ZTUlZO?=
 =?utf-8?B?R3EwTUgxWldNN3Y2R3NCK0xuTStSVkJkUm9NREJ5ZlZrSjJOekx5VWY1Y3lU?=
 =?utf-8?B?ZC84ZTV0bU12dFhkMk1VeTJPbFJ4WkozakJ0UFBIVEFmN2ZIWmN1TndxTExW?=
 =?utf-8?B?d2tHcEh3Wm1Vd0xIZGdlUi8zbGVDdnYrUkcxcVJLMlRnS042eWduQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <173D1FE1D3C99746B8576B13986E61B3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5154.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f1885032-f410-4148-bd11-08da1c7fa9d3
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2022 12:26:25.7788
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: u45XeXOErabK9ZdwXC86NBdmNrw3nT6gQ4Rjh4MxFMFArtxytLhlucLFPkzR/7XjOoqXk1uV5lrvfNIajp1XVBv+yR85rkCTxbekJJWRGNo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB3035
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gMTIvMDQvMjAyMiAxMjoxMCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAxMi8wNC8yMDIyIDE0OjA0LCBD
b25vci5Eb29sZXlAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+IE9uIDEyLzA0LzIwMjIgMTE6NDcs
IEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVu
dCBpcyBzYWZlDQo+Pj4NCj4+PiBPbiAxMS8wNC8yMDIyIDEwOjU5LCBDb25vciBEb29sZXkgd3Jv
dGU6DQo+Pj4+IFRoZSBSVEMgcmVmZXJlbmNlIGFuZCBNU1NQTEwgd2VyZSBwcmV2aW91c2x5IG5v
dCBkb2N1bWVudGVkIG9yIGRlZmluZWQsDQo+Pj4+IGFzIHRoZXkgd2VyZSB1bnVzZWQuIEFkZCB0
aGVpciBkZWZpbmVzIHRvIHRoZSBQb2xhckZpcmUgU29DIGhlYWRlci4NCj4+Pj4NCj4+Pj4gRml4
ZXM6IDIxNDViYjY4N2UzZiAoImR0LWJpbmRpbmdzOiBjbGs6IG1pY3JvY2hpcDogQWRkIE1pY3Jv
Y2hpcCBQb2xhckZpcmUgaG9zdCBiaW5kaW5nIikNCj4+Pj4gUmV2aWV3ZWQtYnk6IERhaXJlIE1j
TmFtYXJhIDxkYWlyZS5tY25hbWFyYUBtaWNyb2NoaXAuY29tPg0KPj4+PiBTaWduZWQtb2ZmLWJ5
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPj4+PiAtLS0NCj4+
Pj4gICAgaW5jbHVkZS9kdC1iaW5kaW5ncy9jbG9jay9taWNyb2NoaXAsbXBmcy1jbG9jay5oIHwg
NSArKysrLQ0KPj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2Nr
L21pY3JvY2hpcCxtcGZzLWNsb2NrLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL21pY3Jv
Y2hpcCxtcGZzLWNsb2NrLmgNCj4+Pj4gaW5kZXggNzNmMmE5MzI0ODU3Li4zY2JhNDZiOTE5MWYg
MTAwNjQ0DQo+Pj4+IC0tLSBhL2luY2x1ZGUvZHQtYmluZGluZ3MvY2xvY2svbWljcm9jaGlwLG1w
ZnMtY2xvY2suaA0KPj4+PiArKysgYi9pbmNsdWRlL2R0LWJpbmRpbmdzL2Nsb2NrL21pY3JvY2hp
cCxtcGZzLWNsb2NrLmgNCj4+Pj4gQEAgLTEsMTUgKzEsMTggQEANCj4+Pj4gICAgLyogU1BEWC1M
aWNlbnNlLUlkZW50aWZpZXI6IChHUEwtMi4wLW9ubHkgT1IgQlNELTItQ2xhdXNlKSAqLw0KPj4+
PiAgICAvKg0KPj4+PiAgICAgKiBEYWlyZSBNY05hbWFyYSw8ZGFpcmUubWNuYW1hcmFAbWljcm9j
aGlwLmNvbT4NCj4+Pj4gLSAqIENvcHlyaWdodCAoQykgMjAyMCBNaWNyb2NoaXAgVGVjaG5vbG9n
eSBJbmMuICBBbGwgcmlnaHRzIHJlc2VydmVkLg0KPj4+PiArICogQ29weXJpZ2h0IChDKSAyMDIw
LTIwMjIgTWljcm9jaGlwIFRlY2hub2xvZ3kgSW5jLiAgQWxsIHJpZ2h0cyByZXNlcnZlZC4NCj4+
Pj4gICAgICovDQo+Pj4+DQo+Pj4+ICAgICNpZm5kZWYgX0RUX0JJTkRJTkdTX0NMS19NSUNST0NI
SVBfTVBGU19IXw0KPj4+PiAgICAjZGVmaW5lIF9EVF9CSU5ESU5HU19DTEtfTUlDUk9DSElQX01Q
RlNfSF8NCj4+Pj4NCj4+Pj4gKyNkZWZpbmUgQ0xLX01TU1BMTCAgIDM0DQo+Pj4NCj4+PiBZb3Ug
aGF2ZSBzb21lIHdlaXJkIG9yZGVyIGhlcmUuIFNob3VsZG4ndCBpdCBiZSB1bmRlciBDTEtfUlRD
UkVGPw0KPj4NCj4+IFllYWggbnVtZXJpY2FsbHkgd2VpcmRseSBvcmRlcmVkIC0gSSBncm91cGVk
IHRoZSBjbG9ja3MgYnkgdHlwZToNCj4+IE1TU1BMTCBpcyBhIHBsbCwgQ1BVL0FYSS9BSEIvUlRD
IGFyZSBhbGwgZGl2aWRlcnMgJiB0aGUgcmVzdCBhcmUgb24vb2ZmDQo+PiB0b2dnbGVzLiBJJ2Qn
dmUgcHJlZmVyZWQgdG8gaGF2ZSByZW51bWJlcmVkIHRoZSB3aG9sZSBsaXN0LCBidXQgdGhhdA0K
Pj4gZGlkbid0IGZlZWwgbGlrZSBhIGdvb2QgaWRlYS4NCj4+DQo+PiBBZGRpdGlvbmFsbHkgTVNT
UExMIGlzIHRoZSBzb3VyY2UgZm9yIENMS197Q1BJLEFYSSxBSEJ9IHNvIEkgcHV0IGl0IGF0DQo+
PiB0aGUgdG9wLiBJIGhhdmUgbm8gcGFydGljdWxhciBwcmVmZXJlbmNlLCBzbyBpZiB5b3Ugd2Fu
dCB0aGVtIHJlb3JkZXJlZA0KPj4gc28gdGhhdCBNU1NQTEwgaXMgdW5kZXIgUlRDUkVGIGp1c3Qg
c2F5IHRoZSB3b3JkIDopDQo+IA0KPiBIbSwgYXJlIHRoZXNlIGluIHRoZSBzYW1lIGNsb2NrIGNv
bnRyb2xsZXIgKGRldmljZSwgbm90IGRyaXZlcik/IElmIHllcywNCj4gdGhlbiBwbGVhc2Ugb3Jk
ZXIgdGhlbSBudW1lcmljYWxseS4gUHJldHR5IG9mdGVuIG9uZSBiaW5kaW5nIGhlYWRlciBoYXZl
DQo+IElEcyBmb3Igc2V2ZXJhbCBjbG9jayBjb250cm9sbGVycywgc28gdGhlbiBpdCdzIGEgZGlm
ZmVyZW50IGNhc2UuDQoNCk5vdCAqcXVpdGUqIHN1cmUgd2hhdCB5b3UgbWVhbiBieSBkZXZpY2Uu
IFRoZXJlIGlzIG9ubHkgb25lIFNvQyB0aGF0DQp0aGlzIGhlYWRlciBhcHBsaWVzIHRvLCBidXQg
aW4gdGhlIGFjdHVhbCBkZXNpZ24gdGhlIE1TU1BMTCBpcyBpbiBvbmUNCmJsb2NrLCB0aGUgUlRD
IGRpdmlkZXIgaW4gYW5vdGhlciBhbmQgQ0xLX0NQVSAtPiBDTEtfQ0ZNIGluIGEgdGhpcmQuDQoN
Cg0K
