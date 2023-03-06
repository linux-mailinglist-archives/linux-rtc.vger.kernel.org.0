Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D59D46ABED3
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Mar 2023 12:55:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229723AbjCFLzb (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 6 Mar 2023 06:55:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbjCFLzU (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 6 Mar 2023 06:55:20 -0500
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B061B1517F
        for <linux-rtc@vger.kernel.org>; Mon,  6 Mar 2023 03:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1678103720; x=1709639720;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=uUecYjiUVnECHCW6u//1vnlQ/sCSgKizo4RNASzaCZ0=;
  b=mDHwEfupjWKkDRF6E/ZDVdX6Bg3lmOlKQmQf7I30PKfwOZ561IEMx8Zp
   ao1Z1kRcnnMSTVbdVivlIvlUXbydr+m9mj4djc1jMn0Bs+qLNlPPVUTbS
   y57A37Tqrpai+wjyNNjbORPAvfhneMgT7vaS0DPcHICLFwK1udUCoRJqa
   xpeZNEEqcEuw+Lk2+pPmewroxh73vyzVyLuu8HzJOcT/JeMNnLnteU8IR
   e5l08LLWaxEfR/0AZrnxR/ghLwSaqBPZkLhcsA/paxShkrJBXbpiVZjsV
   O/jSHxgqUgUSN3nu/4oaNCohhS5/l1962tYDomkJ7KlESQ+wDn9JFOmiH
   A==;
X-IronPort-AV: E=Sophos;i="5.98,236,1673938800"; 
   d="scan'208";a="200114334"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Mar 2023 04:55:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 6 Mar 2023 04:55:18 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 6 Mar 2023 04:55:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJ2dNS7rUN/OhPtd5XtZcreTrvy68MBO8les+HlB6BEoAdiNC0TFBPftT3nZMa9eOZK8RHYRapFwHX6wGWSMuwIYGpvTSyUMlYAniD2RTV9jNyxyrh2oDm/XWIffS03NZMs7uE/TA3hLWbYNNmrARUFlBEj5KxoxRVPkbWFbfFNY41ihE4X7WrCHydp2gVvp8LIERY1TPe7Z5PKkch1254Y2PWXO3p/DkeeadRoHhPvsDOKxeHNtR8LkaTp9NmWbO86y14afxbZ7fyr1odrE9oD7Bd+Z/vJf3UydEAq94HnpC8gcdnb+3K9QZSkEGK2XAV67rPyM29N/wh4WnbcDJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uUecYjiUVnECHCW6u//1vnlQ/sCSgKizo4RNASzaCZ0=;
 b=LE+hEro/dxEqDYGn/xkoKv/+YQbkXLhM5Fiqi7pcanMENwZGKmjrBgtd/e53VDYBOuXoxVoqrGA9JvMxe4zcjC4z/P5K72z+aI9BE7WDaGEU8rvUgmR9xCbd/yOACec5aIhr/inSLBea89qlcksP4rCv48FAQlSBCWo1a3umymHdGVSt0H4bJk7T1nGwCCwZEoPsfGidovvzIst/9Ncz94vU2kkYrU4oWL83gK3J47i8HqMijsv+8G8JKGXN61xWXz1MybUlV29UdjPFdnwJhLuDBccIr0WoywWYYdpPnZgI8WWh13+AMQRU+O1mve0y+zp2SVBMR9+07aNuteQc/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uUecYjiUVnECHCW6u//1vnlQ/sCSgKizo4RNASzaCZ0=;
 b=EZt8mWRbDfBxR3OCTPQ94Yp+5pttj9TwbjHhXubKAEGY875xvERtK8XvoUZjdC6BBR4Ol0Bd2ICuXDjS7oyDkiop6BBsEzoLBgkWVyUie++SkDvo2uDpq354wgGaupUd3P2oY2aK1rVrBRSC+i18dzgwNhtw0eCUowkE33CWqjI=
Received: from BN6PR11MB1953.namprd11.prod.outlook.com (2603:10b6:404:105::14)
 by BN9PR11MB5557.namprd11.prod.outlook.com (2603:10b6:408:102::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 11:55:17 +0000
Received: from BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32]) by BN6PR11MB1953.namprd11.prod.outlook.com
 ([fe80::6eb8:36cd:3f97:ab32%5]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 11:55:17 +0000
From:   <Claudiu.Beznea@microchip.com>
To:     <u.kleine-koenig@pengutronix.de>, <a.zummo@towertech.it>,
        <alexandre.belloni@bootlin.com>, <Nicolas.Ferre@microchip.com>
CC:     <linux-rtc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <kernel@pengutronix.de>
Subject: Re: [PATCH 06/41] rtc: at91sam9: Convert to platform remove callback
 returning void
Thread-Topic: [PATCH 06/41] rtc: at91sam9: Convert to platform remove callback
 returning void
Thread-Index: AQHZUCKEggh0qbH+y0K2OROebtUMRg==
Date:   Mon, 6 Mar 2023 11:55:17 +0000
Message-ID: <97ca3130-3510-6be5-babf-36da8cd116cc@microchip.com>
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
 <20230304133028.2135435-7-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230304133028.2135435-7-u.kleine-koenig@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN6PR11MB1953:EE_|BN9PR11MB5557:EE_
x-ms-office365-filtering-correlation-id: 113d8855-5245-4f28-d1e6-08db1e39a74c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TmjgvEZQf1g3bQv4hYPgkU/zLpVMU4ycBw/QnMD/eFkFZVPsxUW8XtOA0E1IGycEX2HySrSmBJYtciPS/tQREjWr/neXr1n5V16ekUAzxJcwAO8t426P3fnVswrcocBnOEqSK8YSMAir2mZAH8+jZyihz2sc/zcQrvazcIBO0LnY0uEgTqqiLdEH8MqtumXLB0287I5NFxH2Iep57CkW1nghJbvqMVxcDYX8iJJVrbDYjMbwXJ6/K7SaB9OmVRGuMi46a1FKsCF9O0zrqDMN4yuJcMy4rJhPP3c7vionwBdT9ab/RE7aLXqwe28ZF9E/dtgiUxWDzk8g6R3KR2/dHNcJgW8TxnCZHlpP86prkg39fBBCunhk5d+/NYwOHJI3ZUoOX42oelQKppx7guo2Y7wz4kFymu0ktmVkcp1yK3exfeOovps5b1KUW6hl1zg9hno0lA+oxFjRS0Y/fL3gcfM/glalpzqRPo0l6U3QCfNZT8NVnQnbmP85mT131iMIS1hyQ9Q+LwDIED5U1KHs0ouGl37jS9f3wic/zX/+B7+EtsreQpkxAIO8kpgg8ttHUEsFkLnGuhD1t/mL5uzu/mIjb6EgOXI5xR983cFGsV1rEILxcZq9y2fGLXqmWOcWZM0i9LeHgIj4KywyhSjeLJ8ZIJWxnaq8jvgNiYr9BMwkAbWRmGriRAo8ATeGRfxOydYL545jlrMWXqQpjO4VJ6FzgZ58AmfoVw6io21dMbPC/6iZjMqgnaUje5pOPWFheLtpDkNSliK5oQGvXsk56Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB1953.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(136003)(346002)(39860400002)(376002)(451199018)(6506007)(6512007)(53546011)(6486002)(36756003)(38070700005)(83380400001)(31696002)(86362001)(122000001)(38100700002)(186003)(26005)(2616005)(41300700001)(91956017)(66476007)(66946007)(66556008)(76116006)(66446008)(4326008)(8676002)(64756008)(2906002)(8936002)(31686004)(5660300002)(71200400001)(316002)(6636002)(54906003)(110136005)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K25PR2dGbWdkdkszOWRKNG5VeTRqclQ5eHEwem5ZaVR5NVZiSEd6QkdOdlo0?=
 =?utf-8?B?Z0JYeGhOVEZqSnR6UXBpWG55cG1XUDJqb3JsR1N2alJIa1dFbUk1MTlxSGMy?=
 =?utf-8?B?d0VGT1RVMWFKOTdTZ3NNdnVDdVhFdXJDYzFRL2RxNmJQK3RucFFjeW9tWEpB?=
 =?utf-8?B?azZOSitLQ1FPQVlRKzllRG53cVhldVB5a01jWWIwZWg2ZitvUm1xZkw4L1BO?=
 =?utf-8?B?dVZaQ25YZ1hURW4wMG9VUE40bkhybW84VU5PcFBTZ3Z6VkNQci81MXZSc3gz?=
 =?utf-8?B?ZzJlaFdONFJzWkNKRjY4YldnSTczTjdzNVR3ekRBbHRvZ1FNMWJVSmYvUjBH?=
 =?utf-8?B?UE1oNUVFOVhFSmxZUVhQY2o2NGt6ZnZtZDl4ZHp4dG5sRHdYdi83TWE3ZXpw?=
 =?utf-8?B?VVlPV3BpN0FnQWxReDRBMldscFpLUEI3dDQ4cVAzQXZSMkRkWnpyOUFtT2cz?=
 =?utf-8?B?cVJEd3ZEZGF5M2hYSjEwZW1ZbFlmbDBMK3JraEVJSk5KOWNobEJZZi9GU2Mr?=
 =?utf-8?B?ZGduVVFoU0w1c2EzdytDRVE2eWI4SGNVdVlQNHVVS1B4bUpEU1BoeGJaWmZF?=
 =?utf-8?B?aDZqbHlVVEVpZEowQTZHUm9RZHllamF3ckh0UG0yaUp6ZVcxeUVKQ0ltNmJN?=
 =?utf-8?B?Ry9rdXBOanFJZlByeWowbzdyOFkxb1d0aTVxamVyNzdrOTYxdmxra1pJckdR?=
 =?utf-8?B?dUlsUzZxVUtaaWxmdkcwSWlmak1ZeTVoZUN1V0pST0prMk13S2pwUUdSZVN1?=
 =?utf-8?B?bzlQaXk5UUlsMFg4Wnd4UkM4ZVVBYTRkNDlpS1RIYkVSVXV4WEJoRmQ1VVhI?=
 =?utf-8?B?WVVTQnZ5cEszRTRYQzczT1FWZ01PcFI3RnNtTGlrTFNrcW1rdmdFY25wemtp?=
 =?utf-8?B?a0g2RXZuK3F3SVlHZDhIbjZpUmFnYnV6L1VaQVRMNnJySkJWM1dzMUVMZGoy?=
 =?utf-8?B?Mlp3SFJCa2daNVVxYlo1d2tBUnZzVUNDSXpVR3MvMUpaM1RvRDJHZDRnbFJ2?=
 =?utf-8?B?ekdSdk4rcGJYWlpvNU1qQ3hCaTk5QzlqdjlkRkVPWUlDemh1cVpVVGE2WFhn?=
 =?utf-8?B?dEs1RUxrczdXOTZxbVRjNUN0UEpFbW9tcnBtZ2lKdmdnV0lYT2Z3SEVLY004?=
 =?utf-8?B?MWZzWVp0ZTRMV245R1dIRnlwQXNsbitjTVlxS290TnV1Z2JBTDNmakNONUV2?=
 =?utf-8?B?K2ZzNk1vcjFyNzZGZHFaOURWNFU4Q2xpcjRMR3dwclRJVlRTQnFyc0dFbkt6?=
 =?utf-8?B?UEx2amJlV3Rhakp1NkgrR2ZHbFdQcUNrU3VqTEg0QjVjTGFMVFV0YklzMSt2?=
 =?utf-8?B?YVZud3NYaXlMMDZKUEVkN1BPdWJML2txVlN0MkEvT3BLcHZBc1pmam85WG1G?=
 =?utf-8?B?ZTJVZnE3NEdrTGx3T0NvNld4bURqcjQ0UWJJWkJFQ1BNWmVVV1g4OGk0WGJt?=
 =?utf-8?B?MW0wNlR3dGRsazFJUHVPbSsrY0pqKzhxTnp1WGhlUHVrZU5UamRmSkFlNlUv?=
 =?utf-8?B?VzlRdjlvckQ4TkM2LzBkdmZpL3BPNE1tOHh2SEdwRXB1WndHeXF4cGRsM2J2?=
 =?utf-8?B?bER5Q2VMa2E5emNHbERyQisyZ2cwSTNDRzVQZUlzc3VudHRXR2gxYWhodzNt?=
 =?utf-8?B?V3I2bHY1RDhPSFcyRFpkL25VVTVTcGcyNk5wUGJ6aVA2UWQ1TEJpZmJueTNa?=
 =?utf-8?B?aGtYWlg1UGpUQWJ5aG9IOXMrU1NOcTlLTzBpdkxDVmw3Mk9STDAxTEVwSzlE?=
 =?utf-8?B?QjlyV095YWsvaFkyd0dTT29qK2tRUUUybHY3Ym5lQjQ4VDhuMXhGb2xKWWVn?=
 =?utf-8?B?a2tkcE5IU1h0OXArWjFxV3p0aU5pQkIwWkNwVmRDL0gzaE1BODVlZ1lRbXZ0?=
 =?utf-8?B?U2QxRE1GanZNWkRjZVlQWWZDZFRUTUdSczhRYjNJeVNWSTc3dzc2VmVJWVpY?=
 =?utf-8?B?V05RWGlVVmF0akJySDRyZzhXcmcyM2pvbzRDV0diY1BlNGE1TVQ0YkNuWFpX?=
 =?utf-8?B?ekVSdGxNdnMxbHI4U0c2TXRvRXJNSEN5K2NCQ2RWVVZDVnhTSTFYLzUydXNi?=
 =?utf-8?B?UWxrZUhNbTlxY0ZTbzdCZXhjdnV3Q1EvR01TRmJ2a2xwNXpBZTBwaUxCK1Ur?=
 =?utf-8?B?T3lZQndIb29Bb1lKOTIrUVFjaklHbTNFTHQ3b2VXMjlZeUU4bm9YYnBGUUN5?=
 =?utf-8?B?M2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D9031108AADFF24AA79A7CA59FA8875C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB1953.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 113d8855-5245-4f28-d1e6-08db1e39a74c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2023 11:55:17.1230
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Z3TONTvqul8qG14JQiJ1IYA3UUB8GVXLNQ0RWKgvn5sidYekY6t0eK1aeLt/k+4yfC8UgoxNEDgUTGD/esjoOc/9Y9DCLtlSf9rWWhOA6F4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5557
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

T24gMDQuMDMuMjAyMyAxNToyOSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IEVYVEVSTkFM
IEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91
IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gVGhlIC5yZW1vdmUoKSBjYWxsYmFjayBm
b3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMNCj4gbWFueSBk
cml2ZXIgYXV0aG9ycyB3cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVycm9yIGhh
bmRsaW5nIGJ5DQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dldmVyIHRoZSB2YWx1ZSBy
ZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkDQo+IGFuZCB0aGlzIHR5cGljYWxseSByZXN1bHRz
IGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYQ0KPiBxdWVzdCB0
byBtYWtlIHRoZSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRoZSBmaXJzdCBzdGVw
IG9mIHRoaXMNCj4gcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAucmVtb3ZlX25l
dygpIHdoaWNoIGFscmVhZHkgcmV0dXJucw0KPiB2b2lkLg0KPiANCj4gVHJpdmlhbGx5IGNvbnZl
cnQgdGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQ0K
PiBjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
DQoNClJldmlld2VkLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAbWljcm9jaGlw
LmNvbT4NCg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ydGMvcnRjLWF0OTFzYW05LmMgfCA2ICsrLS0t
LQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3J0Yy9ydGMtYXQ5MXNhbTkuYyBiL2RyaXZlcnMvcnRj
L3J0Yy1hdDkxc2FtOS5jDQo+IGluZGV4IGI3YjVlYTFhNGU2Ny4uNjEwZjI3ZGZjNDYyIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL3J0Yy9ydGMtYXQ5MXNhbTkuYw0KPiArKysgYi9kcml2ZXJzL3J0
Yy9ydGMtYXQ5MXNhbTkuYw0KPiBAQCAtNDQyLDcgKzQ0Miw3IEBAIHN0YXRpYyBpbnQgYXQ5MV9y
dGNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIC8qDQo+ICAgKiBEaXNh
YmxlIGFuZCByZW1vdmUgdGhlIFJUQyBkcml2ZXINCj4gICAqLw0KPiAtc3RhdGljIGludCBhdDkx
X3J0Y19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gK3N0YXRpYyB2b2lk
IGF0OTFfcnRjX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KPiAgew0KPiAg
ICAgICAgIHN0cnVjdCBzYW05X3J0YyAqcnRjID0gcGxhdGZvcm1fZ2V0X2RydmRhdGEocGRldik7
DQo+ICAgICAgICAgdTMyICAgICAgICAgICAgIG1yID0gcnR0X3JlYWRsKHJ0YywgTVIpOw0KPiBA
QCAtNDUxLDggKzQ1MSw2IEBAIHN0YXRpYyBpbnQgYXQ5MV9ydGNfcmVtb3ZlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ICAgICAgICAgcnR0X3dyaXRlbChydGMsIE1SLCBtciAmIH4o
QVQ5MV9SVFRfQUxNSUVOIHwgQVQ5MV9SVFRfUlRUSU5DSUVOKSk7DQo+IA0KPiAgICAgICAgIGNs
a19kaXNhYmxlX3VucHJlcGFyZShydGMtPnNjbGspOw0KPiAtDQo+IC0gICAgICAgcmV0dXJuIDA7
DQo+ICB9DQo+IA0KPiAgc3RhdGljIHZvaWQgYXQ5MV9ydGNfc2h1dGRvd24oc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4gQEAgLTUzMSw3ICs1MjksNyBAQCBNT0RVTEVfREVWSUNFX1RB
QkxFKG9mLCBhdDkxX3J0Y19kdF9pZHMpOw0KPiANCj4gIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1f
ZHJpdmVyIGF0OTFfcnRjX2RyaXZlciA9IHsNCj4gICAgICAgICAucHJvYmUgICAgICAgICAgPSBh
dDkxX3J0Y19wcm9iZSwNCj4gLSAgICAgICAucmVtb3ZlICAgICAgICAgPSBhdDkxX3J0Y19yZW1v
dmUsDQo+ICsgICAgICAgLnJlbW92ZV9uZXcgICAgID0gYXQ5MV9ydGNfcmVtb3ZlLA0KPiAgICAg
ICAgIC5zaHV0ZG93biAgICAgICA9IGF0OTFfcnRjX3NodXRkb3duLA0KPiAgICAgICAgIC5kcml2
ZXIgICAgICAgICA9IHsNCj4gICAgICAgICAgICAgICAgIC5uYW1lICAgPSAicnRjLWF0OTFzYW05
IiwNCj4gLS0NCj4gMi4zOS4xDQo+IA0KDQo=
