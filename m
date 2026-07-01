Return-Path: <linux-rtc+bounces-6804-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gt39HzDBRGpf0QoAu9opvQ
	(envelope-from <linux-rtc+bounces-6804-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 09:26:40 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECC86EA9E4
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 09:26:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=microchip.com header.s=selector1 header.b=gk+a3PJX;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6804-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6804-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=microchip.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B4D630156ED
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Jul 2026 07:26:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D380C3B47DF;
	Wed,  1 Jul 2026 07:26:36 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011058.outbound.protection.outlook.com [40.93.194.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8433BADA7;
	Wed,  1 Jul 2026 07:26:33 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782890796; cv=fail; b=Vd7p0eQgWgeWxJE98z87QbFwPFn9GkB/jaftOEg1xrdAa7LNFUy+iRHfpveolkQN8Jyu6Ox5iROWKq7sv9pWTdcNfuUKxVBTzKJwHJ1H/PeGEey5iZFNXvokjVaETy8q4OFi5Dqio73+ZYtYErxY22VG8aBO0s7Z1AFp42VfDIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782890796; c=relaxed/simple;
	bh=qlXT05liwesPEMEmNCzFpT5TqSwNvKZtiIy0P4AAGJA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fh7KDUxAEoH83HpUcrs6Gb5c15NRtO2byk4NUbEJXi8sGn8D7lrofVq2n2JKeURBlZciR/vZMAr2k7N7X5ygVom8+vqH0HzJ03L2AxP3/VmenmKJkuqvHcWLf9TScC8QAlDAv+tDnl0soOjgefgZPq0UjbHakJEoBMcHXI1Qz5w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=gk+a3PJX; arc=fail smtp.client-ip=40.93.194.58
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGxLskypyXn0cWaBn+2wpFnDD2aaZkQFN1QM4BBRaiqG6PTilzIMCpF1gn4jWjtc8jglw4DEkF300s0WDZKxMRS8TkE7VGDHt5NJLgwJspt8e3kkeGs8HvEkF3SA5gTbdFbaW0J5WH7RviN+8CulkDEAFhqZudmRlnvHHBt+F/0xKL7tMVuJrgcQi3ebatXVNSv6Q87ZxUQVUrwRVwHGs3sUYU7ThKx4IyYJfCLMpkscoNJNzGr+vSJ6ACGv/fjkKDkGOtkgXZ7FoFIvPIIbXwkrtnHXGoJybWlUgUGwqFzQy1SjAUJz/4dWC0bI6ZbAYOdrlmCB9BzoVBGlLBBTiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qlXT05liwesPEMEmNCzFpT5TqSwNvKZtiIy0P4AAGJA=;
 b=HPIQa5orDsUYFhQyoUIYGPaOUYFzIZOc6zeIEcO3jsKVeaa9sPYChfKCBHZYUvobrsR54Ej+GDFo0uwUu5uF6j/13POZ5sXYIR8f3DwSTIh1TI7Lq1q8Z7F4vf5xtAU/7oGDCi+e9uObNM2yK72YAbuDOObIEkP1rvhjzX0aLvtbu/pwjwVHFmFL5aav0l39Fg01Q+uRyzSoLUzWOZW5aMkqFAOygcEp6Qtc3aqDEV565jgmCl8UP6QJSQQEv5YEAzMgwCPs9Yt258MeI9UyYVQqVXrr/1NBKk5qxI5jdEMEKkYmd+IY6jXd13Gpw+WWxikKt/Dz3sSafQzYqsh0GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qlXT05liwesPEMEmNCzFpT5TqSwNvKZtiIy0P4AAGJA=;
 b=gk+a3PJXA32q2pbZIZutSsA+7WHtn2drWYZJAtT3rQoB+Uc/IW6q9bhLOC7LlHKrxkrkIvIxTv91ISMoFVQmWK5+uUIYiEckOdbm4++WuwUq4894Fc2UXuoOe8OHA1zKx3q9agOs1KgUlxbLmP2XBPp7Ka3k9o2qcg01Vl4SKSAoZ2JFZ59oKitfUMU35HtBi4Qa2T1FbMwAqacCyjP6hUKq5OcIYE+cnl8ubBwN+S13zWXl8NrPrej4XUcX77ev7knEC+M+RqkoxO79tNADfBqJac/DJU3nlGzs/ol1s31Ju1uA1cJO2hLcQHTQA28K9Lxdb6dnQFxpbgQoRUEb/g==
Received: from SA2PR11MB4905.namprd11.prod.outlook.com (2603:10b6:806:117::7)
 by PH8PR11MB9698.namprd11.prod.outlook.com (2603:10b6:510:3a3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Wed, 1 Jul
 2026 07:26:30 +0000
Received: from SA2PR11MB4905.namprd11.prod.outlook.com
 ([fe80::5062:2:b851:5337]) by SA2PR11MB4905.namprd11.prod.outlook.com
 ([fe80::5062:2:b851:5337%6]) with mapi id 15.21.0181.008; Wed, 1 Jul 2026
 07:26:29 +0000
From: <Balakrishnan.S@microchip.com>
To: <amergnat@baylibre.com>
CC: <alexandre.belloni@bootlin.com>, <baolin.wang@linux.alibaba.com>,
	<zhang.lyra@gmail.com>, <orsonzhai@gmail.com>,
	<linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 4/4] rtc: s35390a: convert to dev_err_probe()
Thread-Topic: [PATCH 4/4] rtc: s35390a: convert to dev_err_probe()
Thread-Index: AQHc7lSqh0XLlZaxsUu2ZdbMr3C+fbZXigsAgADvKYA=
Date: Wed, 1 Jul 2026 07:26:29 +0000
Message-ID: <7867be72-2f25-4ea7-9b08-9ee8a8037ca1@microchip.com>
References:
 <20260528-cleanup-dev-err-probe-rtc-v1-0-29dc9cb6c3f0@microchip.com>
 <20260528-cleanup-dev-err-probe-rtc-v1-4-29dc9cb6c3f0@microchip.com>
 <178283943069.3929176.6475131827523489401.b4-review@b4>
In-Reply-To: <178283943069.3929176.6475131827523489401.b4-review@b4>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA2PR11MB4905:EE_|PH8PR11MB9698:EE_
x-ms-office365-filtering-correlation-id: 92aba0cf-9a7d-4931-06cf-08ded74211ba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|38070700021|18002099003|22082099003|4143699003|11063799006|10086099003|56012099006;
x-microsoft-antispam-message-info:
 hxR10xLE31PSXLNzY40AMLUicQX+SbLI7LU2WFxGFqT9Mpv4PGcdo3IjiLtJ4wGOgf7fTd1s+OIdvc0o9Cf5FEHOUkPYZr7kW4GV94RUKSa/4x+i0qxKoxD5iVkkeOC/02648onBejBPc3sOtWWBCHI3Au1YQH8N0YdSVS960m7dz9a6P3ie5sipbT5EiH9aPB9AEtj3LLfdcPm2BwflRPTL+eUW43F78euC2upTsJeS1YztfbaKlHRKqzO0F9ipu2u2Yfl1xnq+XX7bCMG71/SJjjCZ+TxyvCN5Ms/Y82+Jg9iB+RxnIwufUsJYPbo7Mp80DgDZ6B7w+P0gYryAytKDWto6+m/43V+eA0OGoe8OjtsS3d6UIqwblwb9Y7lD7a4KyKOLhG/XMrx4DzmmecVO/w5hBotfJ0o9jYSA4XdKbdPdVCvrAVxSETstx7/2Ugj/KZSbJjMBsvETpin8WWiY0Jfc7bFvuQLIQmVesRsBP77nIfmDKXuXPigwrwhqFBE+x8LscwTPlYfu7ECdI6obvsp2qYIB2E+u/A/oSYJbLsxuefeabOUWwxobFSfHZZzvoiKSMX/yufyPUL3NajOdqWICTPXlmmoSV2nQcsFWW/bcf0c+6XpW4soYA4LBBZwMqWd5qdiFK3BBaurJdDOL5tsn1JpBd00uEpCyQk1pS2qNC6hR2V54/f8ylBNvuvmyhEcyouFKb29MQSNQ5ROzCxBpBKVqsNqrd1jqy8s=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA2PR11MB4905.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(38070700021)(18002099003)(22082099003)(4143699003)(11063799006)(10086099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZTQxLzhrTXcxSlc5V2VvUWd6VDJjU0lHK00xMzhOYU9mMWZpakd5Z3piRDdD?=
 =?utf-8?B?bkE5YU1XZ3dTbW5iUGFQcC9wWmlKRjcvQjNJU3NMNkhaRzhKRUVyRnRKVkhh?=
 =?utf-8?B?M2RhNU1vWkVFaCtybHBHUEtlajNpSEZISElOZjMrLzFXVDZBaGdHeVAySGRO?=
 =?utf-8?B?VFVrYlhSbnBDNEp1Yjdybk81bGFPN1ljUE45cFhvRktjWnJnbTdZL3Z3NWxo?=
 =?utf-8?B?Sm03WHFwQWhaZDZFa0svL1FJalExRkJYbG9lSmlFSUZtdkt1aS9TdEJMSm56?=
 =?utf-8?B?NElocjE1b0RHdHNCWnZWZnY4TVd5QnJLNzR1S0dlNjVPcktrczhqblh2aG9D?=
 =?utf-8?B?WUFXbUNkUFBCOHpkSUc1K3lpZXlNdW5OUzFsVkJTS0pOZUVuTzhjSVg1V25E?=
 =?utf-8?B?MmtJRU91aVhpLzE1TFd0V04wdjJGbG1CdHRMVFMxTkw1anQxYUZMbmJtZUZZ?=
 =?utf-8?B?UmJodkdHaHhMdXdyS3JtNW9BdGcyYXBTTjI3Q25BSk9DdnltM3NIRVh5Z2pY?=
 =?utf-8?B?OWkxcTE5cG0ySUwrQXpMWVRmRWkvNGl0VjN5SW5iV3RDNUpLMXk3bGN1ZElD?=
 =?utf-8?B?ZWtKejhkelExelhsVzVXblRCYzBlTWJVYUwxV1FWUXpWMjMwenVOdzRpTGJX?=
 =?utf-8?B?NWxxdFYxaUE1dTc5ZXI1UkRkaWxtTlNnSGc2Z2ZQckx1MjlVcWkwL0dKYkNR?=
 =?utf-8?B?WkNqY1dleFdNUm5aRmJUR3Q1RndPMjlDaU84NFozOGQ1dTVqS1RYbzRLRTEy?=
 =?utf-8?B?MnF2cFpYL2RPdlFvMlZiUCt5b1J4NitCOGJULzBtTzg0TnV1WWRMQTRHaFlN?=
 =?utf-8?B?Vk9DWm1iT2wrT1ZqaWxLT0I0bTNrdnFoOWVvZE55cDlOWkNtbTB6RTQ2YnhT?=
 =?utf-8?B?Mm1GRnpDUzMvY3BYU1VYVUM0NmR2UFcxZk9iUjJpem1CdHBoWk9Zay9GRWto?=
 =?utf-8?B?MkoxRzh6UHFaR3BSNUYrZGFsYlRoTjVaT295eHJZdS9FU3dlV2w4VUNUaENx?=
 =?utf-8?B?alRyK3JxeENYY0pqMmhpVWhrMG5mT0ZNaitlUU12M1dCRTU1b0IzbDRNRHRy?=
 =?utf-8?B?TFFHd3IwNUtsc0NFdElHM2ErVWU4Y0NZK2Y5Qkg0WHczOWd1OE5TQjZjOU5h?=
 =?utf-8?B?OHdMMzROaWEvd1dLZ3lOY3dnRUlmU3dxSVQzbEI2akZpY1IwR1hOb240enRR?=
 =?utf-8?B?OGRTY2xNNStsNnJWb2xaMXZFdVVaeEIvV0M5ZTZVR1E0c1dQZGMyMis1S1M2?=
 =?utf-8?B?anVBemdFSThoWFdMNG0vVERHZlcwUGxVUWJYYnd4bloxL25KcGdwa0NNUVYv?=
 =?utf-8?B?MnNnTi9HMnVOQ2tGdnRwN0JFeXJ3QTg2Rzc3QlhVWStkenpla3VMTHh1NlE4?=
 =?utf-8?B?T2llYzRXZEZZS2xpUGh3aXlhSTQ3NzRzbGpRUUtmNnkwbG5TZkJIVDRaNGZN?=
 =?utf-8?B?dTZONlhOZG04UjVzVC8rZ3gyeFZ2RHpWOG45aExOaGJSZlEzWFp5NCtVK3cv?=
 =?utf-8?B?ZEtzQzFOeElZcUV4R0dtaDJDY1JFK0o1Rk1VTkZIOUdnWGE1SkFsNS80L25I?=
 =?utf-8?B?YlNudG1BUlZFV1p6ZDFEelF0UXRHNHhkb3I5bHhHL09ZUGJGQkJNR1M4QTl1?=
 =?utf-8?B?SFhnMDJJVkVmZTFlRE52SHlkcWlMVEIrZjhvZ0NIRWNGY3U3NDIvcWY2ekds?=
 =?utf-8?B?eTFJbml5Wi9mM255SWkxanVMdVFrT0RtMWdVTUhsQ0w4bzVtYnAxTVJ5UjBK?=
 =?utf-8?B?Vm84ZklzWXNvWDlQUHI3dW1QR214eGpCRDRSdjE5cmVxUnQvQVVvY29JSmRl?=
 =?utf-8?B?ODFnYmxhcjk4d2dhK0NWaGhHSWVIOWhvSWlQOFJSVlJmUjF5TTRId1ZjMFVM?=
 =?utf-8?B?NG96eVNPWHRaTGx1MmthbUliUXBuRmFHSGRGQnJobWIrNUxJTzhzb2NENUZk?=
 =?utf-8?B?czBlWG0rN3E3OXY1YWNocllLSi9wMlpTbU5KTXBIZ3BUOFlDcVVEM2p3bGNi?=
 =?utf-8?B?ZWZjbnBaVzdDZUU0QWhpeGJiSitFdEhrblVwMVNjYmZsWUpacUF0b21xMmF6?=
 =?utf-8?B?SzAvL2VxREhaMzNYRko1a2cxL0ZEemdzcVdHc0ZWMWNERUIzZVoxMjZic2ZQ?=
 =?utf-8?B?cmVjTWx0TTRqWGhnVzJhdzhIeTQrMnFUOFJIbTBpRFF2ckxvODlZUkMxbEJx?=
 =?utf-8?B?L2YydGdNV1ZldHZvankxWi9yOEFVcll6R1dCejRrK0NwQm5ZR1VMVXpJSVZZ?=
 =?utf-8?B?MFFMdnU5VzFjc0ZEOXM4S2dBdFVsMkN1M2Nwb1JnbURjSkM3S3IrOEtyc2wr?=
 =?utf-8?B?NzBKdS96OTQ3THVMSW40dXJFbkUwTDNUNXJKQTdMcDZ4aVl2aDdrUT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <76E0C3738F37384FB65E16CA170C7AFC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4905.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92aba0cf-9a7d-4931-06cf-08ded74211ba
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2026 07:26:29.7819
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3PE31Yv/vS+9fQEGBDu+Dv8yySY2oLqpnS6oLUyBAfsD2sP3vfCU2gggKHOtmbngxydlcuZTt+a0nvrlufw6plNlPJZEbMiMMlASpIsvTu4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB9698
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6804-lists,linux-rtc=lfdr.de];
	FREEMAIL_CC(0.00)[bootlin.com,linux.alibaba.com,gmail.com,vger.kernel.org];
	FROM_NEQ_ENVFROM(0.00)[Balakrishnan.S@microchip.com,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:amergnat@baylibre.com,m:alexandre.belloni@bootlin.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:orsonzhai@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:zhanglyra@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Balakrishnan.S@microchip.com,linux-rtc@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-rtc];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,microchip.com:dkim,microchip.com:email,microchip.com:mid,microchip.com:from_mime,baylibre.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0ECC86EA9E4

SGkgQWxleGFuZHJlLA0KDQpUaGFua3MgZm9yIHRoZSByZXZpZXcvZmVlZGJhY2suDQoNCk9uIDMw
LzA2LzI2IDEwOjQwIHBtLCBBbGV4YW5kcmUgTWVyZ25hdCB3cm90ZToNCj4gRVhURVJOQUwgRU1B
SUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25v
dyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBUaHUsIDI4IE1heSAyMDI2IDA5OjE2OjQ3
ICswNTMwLCBCYWxha3Jpc2huYW4gU2FtYmF0aCA8YmFsYWtyaXNobmFuLnNAbWljcm9jaGlwLmNv
bT4gd3JvdGU6DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ydGMvcnRjLXMzNTM5MGEuYyBiL2Ry
aXZlcnMvcnRjL3J0Yy1zMzUzOTBhLmMNCj4+IGluZGV4IGE0Njc4ZDdjNmNmNi4uMzQyZmQyYjU2
OGEzIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ydGMvcnRjLXMzNTM5MGEuYw0KPj4gKysrIGIv
ZHJpdmVycy9ydGMvcnRjLXMzNTM5MGEuYw0KPj4gQEAgLTQ3OSwxMCArNDc5LDggQEAgc3RhdGlj
IGludCBzMzUzOTBhX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+PiAgICAgICAg
ICAgICAgICByZXR1cm4gUFRSX0VSUihydGMpOw0KPj4NCj4+ICAgICAgICBlcnJfcmVhZCA9IHMz
NTM5MGFfcmVhZF9zdGF0dXMoczM1MzkwYSwgJnN0YXR1czEpOw0KPj4gLSAgICAgaWYgKGVycl9y
ZWFkIDwgMCkgew0KPj4gLSAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImVycm9yIHJlc2V0dGlu
ZyBjaGlwXG4iKTsNCj4+IC0gICAgICAgICAgICAgcmV0dXJuIGVycl9yZWFkOw0KPj4gLSAgICAg
fQ0KPj4gKyAgICAgaWYgKGVycl9yZWFkIDwgMCkNCj4+ICsgICAgICAgICAgICAgcmV0dXJuIGRl
dl9lcnJfcHJvYmUoZGV2LCBlcnJfcmVhZCwgImVycm9yIHJlc2V0dGluZyBjaGlwXG4iKTsNCj4g
DQo+IFRoZSBkZXZtX2kyY19uZXdfZHVtbXlfZGV2aWNlKCkgbG9vcCBhYm92ZSB0aGlzIGh1bmsg
c3RpbGwgdXNlcw0KPiBkZXZfZXJyKCkrcmV0dXJuIFBUUl9FUlIoIkFkZHJlc3MgJTAyeCB1bmF2
YWlsYWJsZSIpLiBkZXZfZXJyX3Byb2JlKCkgdGFrZXMNCj4gZm9ybWF0IGFyZ3MsIHNvIGl0IGNv
bnZlcnRzIGNsZWFubHk6DQo+IA0KPiAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRS
X0VSUihzMzUzOTBhLT5jbGllbnRbaV0pLA0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICJB
ZGRyZXNzICUwMnggdW5hdmFpbGFibGVcbiIsIGNsaWVudC0+YWRkciArIGkpOw0KPiANCj4gV29y
dGggY29udmVydGluZyBmb3IgY29uc2lzdGVuY3kgd2l0aCB0aGUgcmVzdCBvZiB0aGUgcHJvYmUu
DQpTdXJlLCBJJ2xsIGZpeCB0aGlzIHRvbyBpbiBuZXh0IHJldmlzaW9uLg0KPiANCj4+IEBAIC00
OTMsMTYgKzQ5MSwxMiBAQCBzdGF0aWMgaW50IHMzNTM5MGFfcHJvYmUoc3RydWN0IGkyY19jbGll
bnQgKmNsaWVudCkNCj4+ICAgICAgICAgICAgICAgIC8qIGRpc2FibGUgYWxhcm0gKGFuZCBtYXli
ZSB0ZXN0IG1vZGUpICovDQo+PiAgICAgICAgICAgICAgICBidWYgPSAwOw0KPj4gICAgICAgICAg
ICAgICAgZXJyID0gczM1MzkwYV9zZXRfcmVnKHMzNTM5MGEsIFMzNTM5MEFfQ01EX1NUQVRVUzIs
ICZidWYsIDEpOw0KPj4gLSAgICAgICAgICAgICBpZiAoZXJyIDwgMCkgew0KPj4gLSAgICAgICAg
ICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiZXJyb3IgZGlzYWJsaW5nIGFsYXJtIik7DQo+PiAt
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIGVycjsNCj4+IC0gICAgICAgICAgICAgfQ0KPj4g
KyAgICAgICAgICAgICBpZiAoZXJyIDwgMCkNCj4+ICsgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gZGV2X2Vycl9wcm9iZShkZXYsIGVyciwgImVycm9yIGRpc2FibGluZyBhbGFybSIpOw0KPiAN
Cj4gVGhpcyBtZXNzYWdlIGlzIG1pc3NpbmcgaXRzIHRyYWlsaW5nIG5ld2xpbmUgKHByZS1leGlz
dGluZykuIGRldl9lcnJfcHJvYmUoKQ0KPiBmb3JtYXRzIGFzICJlcnJvciAlcGU6ICVwViIgYW5k
IGRvZXMgbm90IGFwcGVuZCAiXG4iIGl0c2VsZiwgc28gdGhlIGxpbmUNCj4gcnVucyBpbnRvIHRo
ZSBuZXh0IGxvZyBtZXNzYWdlLiBTaW5jZSB5b3UgYXJlIHRvdWNoaW5nIHRoaXMgbGluZSwgYWRk
aW5nDQo+ICJcbiIgaXMgYSBjaGVhcCBmaXggZXZlbiBpZiB0aGUgaXNzdWUgd2FzIGhlcmUgYmVm
b3JlIHlvdXIgcGF0Y2guDQo+IEkgcmVjb21tYW5kIHRvIGZpeCBpdCA7KQ0KT2theSBub3RlZC4g
V2lsbCBmaXggaXQgdG9vLg0KPiANCj4gLS0NCj4gQWxleGFuZHJlIE1lcmduYXQgPGFtZXJnbmF0
QGJheWxpYnJlLmNvbT4NCg0K

