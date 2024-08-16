Return-Path: <linux-rtc+bounces-1672-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1F89547FC
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Aug 2024 13:22:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAA30284E19
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Aug 2024 11:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A964196446;
	Fri, 16 Aug 2024 11:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="bNyjN2Mq"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2073.outbound.protection.outlook.com [40.107.22.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C247334CD8;
	Fri, 16 Aug 2024 11:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723807370; cv=fail; b=WUnzMrg1kTDyreYTBMafQgSwNDeZkJRcBqKTpymqev7BVWeau6dk+TMVPjcC3UyacGPXUwKbigH56GVf+J6uQohF2ezW6vtQvrEmXJj1YNZ1sOmCdCLcCb6MzNX4qebMlqP3cUEOi7DnH+8db79A/GLEdsmOXst2xRh+zz8UaDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723807370; c=relaxed/simple;
	bh=w4oXqNJKE0j+dz4Stf3VwnQk8Aalmu8rmNYSW4CAEys=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=b3nh0OZZ+t9nExE4LxPj8xBhl+mqOVkNPJEnHeE/qScnuOdS66vt2W0bxxo02/XSav+3oVK71HuXVyPaszAEVt/6p9cX0wiKiXEyQd/N5AW+/7/O/xfyqSxHec6xTgtSic4wX9OZSvhwcU14gPq71cLy34M/t0SyX6qSEv+RZZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=bNyjN2Mq; arc=fail smtp.client-ip=40.107.22.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YM1DvtXeXGKIG23emKSHAMl03UcyQe/yrZ7sHR29fsnI6MeeJ+Xy6P6TAL9UlkwnizaI8cy6iD/ZEP+i6x+kZz+VmZzraNdfvYREe3TqD1rCDlyBmjBhrR1gmre7SjRyAt6WFyatWiePLksaAatPz05KomKdaJGKkoUj2i6kqF0c+jrYKuHXrjoUd1JJaCjKoBtpLttcKYGy8yV55icu3sSM3umNK/DBVVkCKuk4gHCV7qS1ZpO/Rr2ybEQEu9G3yEN0uXDWf1TAEY30OPW7PdejDHwvYeUaPKaiq/wd/vBiWgb52EpIwVbsGC5bsRueBfY2z8/0YYtpv3PZQ2gitg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w4oXqNJKE0j+dz4Stf3VwnQk8Aalmu8rmNYSW4CAEys=;
 b=IeBokouPLtqU5nyCNFTDfI6Piis/XHJKPav4F2NVUX3qviXYWY9XBtZXlUNh39CwCEeOBYfXOeYresKa1QJj6CJbp0wSfdVZNB/qGC21bVCviXrgqdaWuBhZU7Lf6AsbfWD7ypKOfpJVwm3VjbJNomdiNDvKTABg1XglXishbChXpttkxwMhgWCGZ1MeFFKRjpC/HpCLFDelwc54ONLljPqZE5be/EsT3NbDC2ZmtYShAJOnhFrLzNOSloD/L9zDxr+RBJpxGT/uVsEK+fWeSzrcnInnL2Rq4HCFdzAqP7J3g64cwLG8jFkrVQipG2Gsfv5atc6U89WkMJBp9CFuFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w4oXqNJKE0j+dz4Stf3VwnQk8Aalmu8rmNYSW4CAEys=;
 b=bNyjN2Mq4klFVo+NU7dK7juCobcRXBTzQjc+Xr8pHHshKmIrIoH5XMUwdnpXyFEyPSWYVoU/DVPaoVxjhp8EV8kX99qP/NucVdm2xukZMmrZZ0lxIQarxi46DWG3IRWa9X/nWAaMNQ5ProDrCpO0my923gVOiFW49zAQIKQJcbzW4NkQwtYPmc5Jm3zcXDgWgZKW7jLE9tPPcKUKs19+mNDz8bjI+6z6vwNlBaKFO/OX/hPw2NVP4QH3Zf7tC2b+B7MjRPEp1pt+g2yuvgIzZHMOgTvipOVNkBovtxyfJu/3JnQGX5rNrFxZlLzeG9lXiODy4Nh5J3w62Qf2g4SK5A==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by AS8PR04MB7797.eurprd04.prod.outlook.com (2603:10a6:20b:2a8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Fri, 16 Aug
 2024 11:22:44 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%6]) with mapi id 15.20.7875.016; Fri, 16 Aug 2024
 11:22:44 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH v7 0/7] firmware: support i.MX95 SCMI BBM/MISC Extenstion
Thread-Topic: [PATCH v7 0/7] firmware: support i.MX95 SCMI BBM/MISC Extenstion
Thread-Index: AQHa40fEPyVCotchkEOnFP0xvgvrn7Ip1eMQ
Date: Fri, 16 Aug 2024 11:22:43 +0000
Message-ID:
 <PAXPR04MB84591BA31D74C164E59A3B9688812@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
In-Reply-To: <20240731-imx95-bbm-misc-v2-v7-0-a41394365602@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|AS8PR04MB7797:EE_
x-ms-office365-filtering-correlation-id: 391936d7-e95c-4057-0f89-08dcbde5bfb8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|1800799024|376014|366016|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?WWxxZXhzR2ZUbk1rTjdub3paamZySEo5T1RVMUplTEQwVzVVemFMNVc0YnNF?=
 =?utf-8?B?TG1lZEdRUzBqS0gyS09haEpaQjc3dzZ1Ny9UZmpCSldmS3JDVW9zUUtZRDFN?=
 =?utf-8?B?d0wxYmtLYytjRWIwM3MzVXhxc2RZaG1QYldxQloyQS9TNGp2UDl6cE4wK2J5?=
 =?utf-8?B?MVBFUmZDNFArellaelRjL3hGZWgyTkZPWHJGdy80RTlqMnJ0TGtGOUx5Wk94?=
 =?utf-8?B?WU40SDBKVHZnTDliYmV4SW5vd3pKVW1LVU1Ga2NNUXdGS2NURjdieE5vMDVs?=
 =?utf-8?B?b3pNSUVMMGdBVEpjYjVxeXJZbWlOT01RZDNFMFVxbnJRRmptN0RSY29pZ2Fp?=
 =?utf-8?B?d2xRNCswSmlYcTFSVmg1OGZaYUtPeVhvMnhFNDBzbXB3RitKeVprUVA4eDRs?=
 =?utf-8?B?ZEMxM2VDRlNmcUs2bWl5WTNFL0w0Zm4vOWJxRmluVnU3UWRNRUMxcXh6bkV5?=
 =?utf-8?B?VG1MMjAxV2lhM3owS21DYStkMXJTdHd5UlpLcmFxeVcyUlJkYUtWK1JQK1li?=
 =?utf-8?B?NkxJWnRUbUo0U1dlZXVwWWNXVUlPdEZRUGpWaDVKOWFqMExtcVhHb2NrUjVT?=
 =?utf-8?B?ejFxUjZYZy85N05XQVRDc1pZaDUvSTVFcldsTEI0VCtLQ2pMdTJ1TjcyUDZ1?=
 =?utf-8?B?OUtKaVhuSVJHWS9MVVdra0NuNEQrRGd2dnZDNmJMdVNkRitlZlpnK0hIejZu?=
 =?utf-8?B?Nlg0MTJJdnp5YXdmdTVwUkRlNU5DS2NYWkxxSWdZcTNGRWplelhJRW5vbjRo?=
 =?utf-8?B?eDlOdkZXV05JbFVzdTFpTldyQ2hhUkVKT3BtQUdhekN6cEtPcU50bDViVWZW?=
 =?utf-8?B?OHBsNHVDNVNDaHVTR2hyYTkxTVM5cEdGYlhkcFpzNFM3Mlh2M2JWMHZISmZ2?=
 =?utf-8?B?M2cxT2VuWmJlMDdORWV5bFkrZE9OSEJCK2hDVEpZUjdZcUNnNHRvQ2dndklY?=
 =?utf-8?B?NE1jbXRlb2lZb2JOZitsR3AwRnB1NFBtOFc1VzhCdEI4cXFlOGM0WWxobXo0?=
 =?utf-8?B?RU1WQ2VFd2c1Z0FYcWN4OG00T3hKdTl6TnZ4VXQreGwxUXkySjBDNHZnbGJS?=
 =?utf-8?B?RWZDUiszYWZUOGUvdStGSkkxQ0JnMnZleGNuSGNGZlN0bVR0WXpMZGtmN3R5?=
 =?utf-8?B?ZkpXMXAxa0tvQU13Q3M2T1BxZytKWHFGWk9DaWI5bGtBYTJRY3JmTkdRdExt?=
 =?utf-8?B?ZEZBd1hnd2tMM3NoN0taOE9wMk1HVVV1a1B3QVQ0M2J6elN4SHhldUhJSHVj?=
 =?utf-8?B?S2MyN2lMUjZ6STdKRjFKUmx5NDlzQVQrRmp2eStpMjE1em5Pc2x2aXVDa1Q4?=
 =?utf-8?B?RzFpc2EvV0xIWFR1NEZSTFpLWjQ0YkV0THRPMXpBeGxQK1hmRW1ma3NBUlB2?=
 =?utf-8?B?dkNnZXQrTkVlWEEzc1dETTZnL2preENYUWlGMlhxL1h0QXdyZWRjL2xCc1pP?=
 =?utf-8?B?aUxFVUFRSm9QNTJEQ0VaZFV5MVpjWEdrTVNDS2V4NHhVNVpsamJ6SlgydGZk?=
 =?utf-8?B?NlFiQ3VxNExGdVFkTGpSR3kwSmtjb0JqZWR1TXJyMkg3V0V0Q05hMUUxTkJG?=
 =?utf-8?B?akU3dEVUcHY4ZEhYdUw1ZWRhZ1JpeGZTNzZtVFJ5MG1zWjhBNmdwWXI3NUxz?=
 =?utf-8?B?RllhY056YTVQdUtrUEtzMTFFeFE0OW5EWjhVZW9CNXZEQ3NQWVRRTzNIZDJv?=
 =?utf-8?B?NXdpNW9xbDY2NzlaMXpTOHVENkVac21JRVc2WDBEQWpXclZGclhmYVlVOGl1?=
 =?utf-8?B?eXZFd2pPaUpmV0hIYWsxVE9GSnE4T0ZmQWNzVGx2YTh0OHpLODFreGpWNVI3?=
 =?utf-8?B?U3pId1hueEZsc3ZZQmNDSEJEayswU1ozdjRQZHlsNVg3dVdSL2YwY0VyMVB5?=
 =?utf-8?Q?V06XPblgp2x7L?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZzVWdURhdUpzNjh5c1hNUmkxbXYwY0pRcDNkOGF3RXNwYWFUZTE3UWJONVNo?=
 =?utf-8?B?WUVhTkU0VEV6MlpneDEyQStnN3VNSUd5OVV0Rm1lYzF1UHZqOGJuVjM5RFpt?=
 =?utf-8?B?bndaNW4za2NCbng1WiswQi9VbUtaRE91byt6eE5MS1M0VGM1YkdXaFpQc1lq?=
 =?utf-8?B?SUwvNG0vN1BjU2RqV2RKeGxHUmlndzVnY2VVMkRDOTRHK3NycjVjTnJwa3pJ?=
 =?utf-8?B?SFFWMTNkZFhVU3ljaERJenhlQzh5SUp3V2xkYVRFaU11MzAya2Z0eHQ1S0tQ?=
 =?utf-8?B?dElDMU1JV3FReVBuQnJ3aDJ6bGdmdWpsMjBxdnZnMVYwM2VrOS9sUGxYVURJ?=
 =?utf-8?B?M2FsMFhhRGZoeml6bFhUK1dQdU9xcmxDYlI1Zm5MRkF1Z2RWMmNFMVBVRlJX?=
 =?utf-8?B?UVM2Wmp0aFEvRWpMcWZML2EyYnBWWGhaSjBRMlZpS2t0K3ZiUzdSSG1YK3VX?=
 =?utf-8?B?NitJYUJzeGdVQmlabEZkNG9JbWN0Sm44OGpGOC9IQXVhMldPR1cvMmJYZCtG?=
 =?utf-8?B?eXE1VVE5aStrSDRROGFPRktTZ2xvNFlBN2J2Z3p4V0U2cndDcXFQcXBzRVZY?=
 =?utf-8?B?eVdFMWtvQ1locUxCSjh4ZGptTXVPT2tVcDg3OGR1N3hlTzVIZlBKWXI2cE1p?=
 =?utf-8?B?dXNWVlNwakRGczZjekFnSXZYSkQwMFpqYy8rM1ExczhVVTBjYXVqU0h0UE02?=
 =?utf-8?B?MnIzRnlaMWRzM09VTFNLOC9UbER5aXVSQ1RyNlNCTlpnbTBSc1ZUV3pTbjFs?=
 =?utf-8?B?eForTFpxS3VNbEZIdWYrZTBNZ2Z1b3U1OHgrSTMwTlJ2emhjbWg5QzJFUjBC?=
 =?utf-8?B?d3IxMldVOThHbENTRUhOUXp5cEJEVzhKckY0NUdsOGJSVWZuQjdJSXFLZFE1?=
 =?utf-8?B?MzlRajhHZWZGZ3VQSWhFdWlmeEJiNDhZMHNlUU5ucnBjaFNQTm8rd2ZNVmNE?=
 =?utf-8?B?bjJvV01YRHlwN0Z4em9ldWtlcFFuQ2h3R04zMVY0UXFwT1hpRlpjUlpZTldn?=
 =?utf-8?B?TVM4aUw2SkRndWlWZlhpcFVRZ05KekNxRW12VGlxeGlxUlVpWkdHbGU4WFNv?=
 =?utf-8?B?Nk5NOEJxdENRdnFwYk80UEdPb24yWmNGaE9kMGZ3K1ZDTDVCaTRwTktzWkJ3?=
 =?utf-8?B?VnFUT2pMaFZzc1ZvYjd1SUlWSzYzY3BhSERDRWtKZmYyS1FWZFRTVmFFb3hP?=
 =?utf-8?B?THFDdFQxcVdFaVFLWDMwNldmSEdmQmhZK3VDbVprUlV1eU4rUG9rUUpxN2Jl?=
 =?utf-8?B?c0ZhSjlNaHFMK2tiaDkzcXVrN3JDS2J0MzZtMDRPQTdjaWNkRm96WGdtSEha?=
 =?utf-8?B?dHEyZnBQWjUxajVkYnhaWENFZU5jK3IveCtSTWFKUTd4UXNoODZxZ3RSQm1q?=
 =?utf-8?B?ajZhWmlmSERBdGRsVmZGOUlBbTlDRVNkQ1ZwU3JHanhrYWxHenMwZWU3SWNH?=
 =?utf-8?B?SDlYWENIUzRMVDZUemtFQVRDUUt4NW9WWHV0ekRIcDZIaTdXVWdEQ1dTSldt?=
 =?utf-8?B?cm5JU1pnOHdIQlI3NmxhWENLZnY1T05iVk5tVENSUTl0WHA0ZkpnWmltTk1O?=
 =?utf-8?B?TjVBUUlQVkhkVFFQYUUyenJwZXhkOXBFYnNoVDVlYVlwbExsWmZaWDhZMkJw?=
 =?utf-8?B?bFBnaVp6SFlMME9TSi8rSFJLSkRBdWp1QXpSMXhwL0R2Q1ZCck55a0J1bEJN?=
 =?utf-8?B?SjcySGNyMUdlQ09qOW5kREpLYnFpZE1jZWx5N2JIRE5oSEN1c0ZPREMrLzhx?=
 =?utf-8?B?TGdTc0Uzb3dKVlZTbExMcThMeTQ0b1RrTzgzQUhaUk5oZzJTRVNZWStXM3lk?=
 =?utf-8?B?SXk0SjJ6MkhwRGorRTBhT3l3UHQzSFQyWHVwRXVZMmYxZkNlL25oUmMxdkJ2?=
 =?utf-8?B?U2dXTzFJY2kvYlJ6VkU5WVNnVEpDN1hySEVHSVlocHpmUmhpWGprdk0yVDJE?=
 =?utf-8?B?MlNiWlBIM2t4eU02UGlxVklPcmFpRm02QjJuTldGVWJEL1hibTYwcHVlbjBu?=
 =?utf-8?B?MVhuUk5tTmd4bWJlak5YWVJtbVpSeCtVcFgxQmt2UUU1aHZNd0h4Q0xpQVlR?=
 =?utf-8?B?ckZheXU2WDQ1RnVheG9PKzBNTzBUNFdtRHFJVGRRbkJTbEVoRC9SYW5LaXFn?=
 =?utf-8?Q?8tGE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 391936d7-e95c-4057-0f89-08dcbde5bfb8
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Aug 2024 11:22:44.1264
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wuVFJEsQLFUgRMV032I0WDRnQQhSaYG3oyBdp/HzI4KKW8MuL1fOASwtDS42FedZHadAqCETUuIE9UhDossd0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7797

SGkgU3VkZWVwLA0KDQo+IFN1YmplY3Q6IFtQQVRDSCB2NyAwLzddIGZpcm13YXJlOiBzdXBwb3J0
IGkuTVg5NSBTQ01JIEJCTS9NSVNDDQo+IEV4dGVuc2lvbg0KDQpXb3VsZCB5b3UgcGxlYXNlIGdp
dmUgYSBsb29rIG9uIHBhdGNoIFsxLTRdLzc/DQpDcmlzdGlhbiBoYXMgZ2F2ZSBoaXMgUi1iLCBh
cmUgdGhlIHBhdGNoZXMgZ29vZCBmb3IgeW91IHRvIHBpY2sgdXA/DQoNClRoYW5rcywNClBlbmcu
DQoNCj4gDQo+IGkuTVg5NSBTeXN0ZW0gTWFuYWdlciBGaXJtd2FyZSBzb3VyY2U6IGh0dHBzOi8v
Z2l0aHViLmNvbS9ueHAtDQo+IGlteC9pbXgtc20gVG8gZ2VuZXJhdGUgaHRtbCBmcm9tIHRoZSBy
ZXBvOiBtYWtlIGh0bWwNCj4gDQo+IGkuTVg5NSBTeXN0ZW0gTWFuYWdlciBGaXJtd2FyZSBzdXBw
b3J0IHZlbmRvciBleHRlbnNpb24gcHJvdG9jb2w6DQo+IC0gQmF0dGVyeSBCYWNrZWQgTW9kdWxl
KEJCTSkgUHJvdG9jb2wNCj4gICBUaGlzIHByb3RvY29sIGlzIGludGVuZGVkIHByb3ZpZGUgYWNj
ZXNzIHRvIHRoZSBiYXR0ZXJ5LWJhY2tlZCBtb2R1bGUuDQo+ICAgVGhpcyBjb250YWlucyBwZXJz
aXN0ZW50IHN0b3JhZ2UgKEdQUiksIGFuIFJUQywgYW5kIHRoZSBPTi9PRkYNCj4gYnV0dG9uLg0K
PiAgIFRoZSBwcm90b2NvbCBjYW4gYWxzbyBwcm92aWRlIGFjY2VzcyB0byBzaW1pbGFyIGZ1bmN0
aW9ucyBpbXBsZW1lbnRlZA0KPiB2aWENCj4gICBleHRlcm5hbCBib2FyZCBjb21wb25lbnRzLiBU
aGUgQkJNIHByb3RvY29sIHByb3ZpZGVzIGZ1bmN0aW9ucyB0bzoNCj4gDQo+ICAgLSBEZXNjcmli
ZSB0aGUgcHJvdG9jb2wgdmVyc2lvbi4NCj4gICAtIERpc2NvdmVyIGltcGxlbWVudGF0aW9uIGF0
dHJpYnV0ZXMuDQo+ICAgLSBSZWFkL3dyaXRlIEdQUg0KPiAgIC0gRGlzY292ZXIgdGhlIFJUQ3Mg
YXZhaWxhYmxlIGluIHRoZSBzeXN0ZW0uDQo+ICAgLSBSZWFkL3dyaXRlIHRoZSBSVEMgdGltZSBp
biBzZWNvbmRzIGFuZCB0aWNrcw0KPiAgIC0gU2V0IGFuIGFsYXJtIChwZXIgTE0pIGluIHNlY29u
ZHMNCj4gICAtIEdldCBub3RpZmljYXRpb25zIG9uIFJUQyB1cGRhdGUsIGFsYXJtLCBvciByb2xs
b3Zlci4NCj4gICAtIEdldCBub3RpZmljYXRpb24gb24gT04vT0ZGIGJ1dHRvbiBhY3Rpdml0eS4N
Cj4gDQo+IC0gTUlTQyBQcm90b2NvbCBmb3IgbWlzYyBzZXR0aW5ncw0KPiAgIFRoaXMgaW5jbHVk
ZXMgY29udHJvbHMgdGhhdCBhcmUgbWlzYyBzZXR0aW5ncy9hY3Rpb25zIHRoYXQgbXVzdCBiZQ0K
PiAgIGV4cG9zZWQgZnJvbSB0aGUgU00gdG8gYWdlbnRzLiBUaGV5IGFyZSBkZXZpY2Ugc3BlY2lm
aWMgYW5kIGFyZQ0KPiB1c3VhbGx5DQo+ICAgZGVmaW5lIHRvIGFjY2VzcyBiaXQgZmllbGRzIGlu
IHZhcmlvdXMgbWl4IGJsb2NrIGNvbnRyb2wgbW9kdWxlcywNCj4gICBJT01VWF9HUFIsIGFuZCBv
dGhlciBHUFIvQ1NSIG93bmVkIGJ5IHRoZSBTTS4NCj4gICBUaGlzIHByb3RvY29sIHN1cHBvcnRz
IHRoZSBmb2xsb3dpbmcgZnVuY3Rpb25zOg0KPiANCj4gICAtIERlc2NyaWJlIHRoZSBwcm90b2Nv
bCB2ZXJzaW9uLg0KPiAgIC0gRGlzY292ZXIgaW1wbGVtZW50YXRpb24gYXR0cmlidXRlcy4NCj4g
ICAtIFNldC9HZXQgYSBjb250cm9sLg0KPiAgIC0gSW5pdGlhdGUgYW4gYWN0aW9uIG9uIGEgY29u
dHJvbC4NCj4gICAtIE9idGFpbiBwbGF0Zm9ybSAoaS5lLiBTTSkgYnVpbGQgaW5mb3JtYXRpb24u
DQo+ICAgLSBPYnRhaW4gUk9NIHBhc3NvdmVyIGRhdGEuDQo+ICAgLSBSZWFkIGJvb3Qvc2h1dGRv
d24vcmVzZXQgaW5mb3JtYXRpb24gZm9yIHRoZSBMTSBvciB0aGUgc3lzdGVtLg0KPiANCj4gVGhp
cyBwYXRjaHNldCBpcyB0byBzdXBwb3J0IHRoZSB0d28gcHJvdG9jb2xzIGFuZCB1c2VycyB0aGF0
IHVzZSB0aGUNCj4gcHJvdG9jb2xzLiBUaGUgdXBwZXIgcHJvdG9jb2wgaW5mb21hdGlvbiBpcyBh
bHNvIGluY2x1ZGVkIGluIHBhdGNoIDENCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFBlbmcgRmFuIDxw
ZW5nLmZhbkBueHAuY29tPg0KPiANCj4gQ2hhbmdlcyBpbiB2NzoNCj4gLSBKdXN0IGNvcnJlY3Qg
Ui1iIHRhZyBmcm9tIFJvYiB0byBkcm9wIHF1b3RlcyAiIiwgYW5kIHJlYmFzZWQNCj4gLSBMaW5r
IHRvIHY2OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNzE4LWlteDk1LWJibS1taXNj
LXYyLQ0KPiB2Ni0wLTE4ZjAwOGUxNmU5ZEBueHAuY29tDQo+IA0KPiBDaGFuZ2VzIGluIHY2Og0K
PiAtIEFkZCBSLWIgZnJvbSBDcmlzdGlhbiBmb3IgcGF0Y2ggMiwzLDQsNSw2DQo+IC0gQWRkIGEg
bmV3IGZ1bmN0aW9uIHBhcmFtZXRlciAnYm9vbCBlbmFibGUnIHRvIHJ0Y19hbGFybV9zZXQgaW4g
cGF0Y2gNCj4gMg0KPiAtIERyb3AgZGV2X2VyciBwZXIgUlRDIG1haW50YWluZXIsIG1vdmUgZGV2
bV9ydGNfcmVnaXN0ZXIgdG8gZnVuY3Rpb24NCj4gICBlbmQgaW4gcGF0Y2ggNg0KPiAtIEFkZHJl
c3MgQ3Jpc3RpYW4ncyBjb21tZW50IHRvIGRvY3VtZW50YXRpb24uIEFsc28gbW92ZWQgdGhlDQo+
ICAgZG9jdW1lbnRhdGlvbiB0byBwYXRjaCAzLCB3aGljaCBhZGRzIHRoZSBpbXgucnN0IHVuZGVy
DQo+ICAgZHJpdmVycy9maXJtd2FyZS9hcm1fc2NtaS9pbXgNCj4gLSBBZGQgcmVtb3ZlIGhvb2sg
dG8gY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jIGluIHBhdGNoIDcNCj4gLSBMaW5rIHRvIHY1OiBo
dHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNjIxLWlteDk1LWJibS1taXNjLXYyLQ0KPiB2
NS0wLWI4NWE2YmY3NzhjYkBueHAuY29tDQo+IA0KPiBDaGFuZ2VzIGluIHY1Og0KPiAtIENvbGxl
Y3RlZCBtaXNzaW5nIGNvbW1lbnRzIGluIHYxLCBJIG5vdCBpbnRlbmQgdG8gbWlzcyBhbnksIGFu
ZCBzb3JyeQ0KPiAgIGlmIEkgbWFrZSBzb21ldGhpbmcgd3JvbmcuDQo+IC0gVXBkYXRlIHRoZSBk
b2N1bWVudGF0aW9uIHBlciBDcmlzdGlhbidzIGNvbW1lbnRzLiBOb3Qgc3VyZSB3ZQ0KPiBuZWVk
IGEgIG5ldyBkaXJlY3RvcnkgZm9yIGZpcm13YXJlIHN0dWZmLCBub3QgZmlybXdhcmUtZ3VpZGUg
ZGlyZWNvdHlyLg0KPiAtIEFkZGVkIFItYiBmb3IgcGF0Y2ggMyAiZmlybXdhcmU6IGFybV9zY21p
OiBhZGQgaW5pdGlhbCBzdXBwb3J0IGZvcg0KPiBpLk1YIEJCTSBwcm90b2NvbCINCj4gLSBGb3Ig
cGF0Y2ggNCwgYWRkZWQgY29tbWVudHMgaW4gc2NtaV9pbXhfbWlzY19jdHJsX3ZhbGlkYXRlX2lk
LCB1c2UNCj4gICBudW1fc291cmNlcyBpbiBzY21pX3Byb3RvY29sX2V2ZW50cywgbW92ZQ0KPiBz
Y21pX2lteF9taXNjX3Byb3RvY29sX2luaXQNCj4gICBuZWFyIGluaXQsIHVzZSBnZXRfbWF4X21z
Z19zaXplIGFuZCBkcm9wIE1JU0NfTUFYX1ZBTC4NCj4gLSBTZXBhcmF0ZSB0aGUgc20tYmJtLmMg
aW50byBydGMgYW5kIGtleSBkcml2ZXJzIHdpdGgNCj4gICBlYWNoIGhhcyBpdHMgb3duIG5vdGlm
aXkgY2FsbGJhY2ssIHB1dCB0aGUgZHJpdmVyIGluIHJ0YyBhbmQgaW5wdXQNCj4gICBkaXJlY3Rv
cnksIGhhbmRsZSBlcnJvciByZXR1cm4sIGFkZCBrY29uZmlnIGZvciBlYWNoIGRyaXZlciwgdXNl
DQo+ICAgdG9fZGVsYXllZF93b3JrLCB1c2UgUkVBRC9XUklURV9PTkNFLCBzdGlsbCBrZWVwIG9w
cyBhcyBwcml2YXRlLA0KPiAgIGRldmljZV9pbml0X3dha2V1cCBzZXQgZmFsc2UgaWYgZmFpbHVy
ZS4NCj4gLSBGb3IgcGF0Y2ggNSwgQWRkIGtjb25maWcgZm9yIHNtLW1pc2MuYy4gT25seSBzdXBw
b3J0IG9uZSBpbnN0YW5jZSwgc28NCj4gYWRkIGEgY2hlY2sNCj4gICBvcHMgaW4gcHJvYmUuDQo+
IC0gTGluayB0byB2NDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDUyNC1pbXg5NS1i
Ym0tbWlzYy12Mi0NCj4gdjQtMC1kYzQ1Njk5NWQ1OTBAbnhwLmNvbQ0KPiANCj4gQ2hhbmdlcyBp
biB2NDoNCj4gLSBSZWJhc2VkIHRvIG5leHQtMjAyNDA1MjANCj4gLSBBZGRlZCB2ZW5kb3Ivc3Vi
LXZlbmRvciwgY3VycmVudGx5IHRoZSBzdWItdmVuZG9yIGlzICJpLk1YOTUgRVZLIiwNCj4gICB0
aGlzIG1heSBub3QgYmUgcHJvcGVyLCBJIHdpbGwgY2hlY2sgd2l0aCBmaXJtd2FyZSBvd25lciBv
biB0aGlzIHRvDQo+ICAgc2VlbiBhbnkgdXBkYXRlLiBwbGVhc2Ugc3RpbGwgaGVscCByZXZpZXcg
b3RoZXIgcGFydHMgb2YgdGhlIHBhdGNoc2V0Lg0KPiAtIEFkZGVkIGNvbnN0cmFpbiB2YWx1ZSBp
biBiaW5kaW5nIGRvYywgY2hhbmdlIHRoZSBwcm9wZXJ0eSBuYW1lIGZyb20NCj4gICBueHAsd2Fr
ZXVwLXNvdXJjZXMgdG8gbnhwLGN0cmwtaWRzIHRvIG1hdGNoIGZpcm13YXJlIGRlZmluaXRpb24u
DQo+IC0gUHV0IGkuTVggY29kZSB1bmRlciBuZXcgZGlyZWN0b3J5IGlteC8NCj4gLSBDaGFuZ2Ug
dGhlIG1pc2MgZXZlbnQgZnJvbSB0aHJlZSB0byBvbmUsIHRoZSBjb2RlIGluIHByZXZpb3VzDQo+
IHBhdGNoc2V0DQo+ICAgd2FzIHdyb25nLg0KPiAtIExpbmsgdG8gdjM6IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL3IvMjAyNDA0MTItaW14OTUtYmJtLW1pc2MtdjItDQo+IHYzLTAtNDM4MGE0MDcw
OTgwQG54cC5jb20NCj4gDQo+IENoYW5nZXMgaW4gdjM6DQo+IC0gVXBkYXRlIGNvdmVyIGxldHRl
ciBhbmQgcGF0Y2ggY29tbWl0IGxvZyB0byBpbmNsdWRlIG1vcmUNCj4gaW5mb3JtYXRpb24uDQo+
IC0gQWRkIGRvY3VtZW50YXRpb24gZm9yIEJCTSBhbmQgTUlTQyBwcm90b2NvbHMgdW5kZXINCj4g
ICBEb2N1bWVudGF0aW9uL2Zpcm13YXJlLWd1aWRlL254cC4gTm90IHN1cmUgaWYgdGhpcyBpcyBh
IGdvb2QgcGxhY2UuDQo+IC0gRml4IHRoZSBiaW5kaW5ncywgaG9wZSBJIGhhdmUgYWRkcmVzc2Vk
IHRoZSBpc3N1ZXMuDQo+ICAgRHJvcCBpbXgsc2NtaS55YW1sLg0KPiAgIEFkZCBueHAsaW14OTUt
c2NtaS55YW1sIGZvciBOWFAgdmVuZG9yIHByb3RvY29sIHByb3BlcnRpZXMuDQo+ICAgQWRkIGNv
bnN0cmFpbnRzLCBhZGQgbnhwIHByZWZpeCBmb3IgTlhQIHZlbmRvciBwcm9wZXJ0aWVzLg0KPiAg
IFVzZSBhbnlPZiBpbiBhcm0sc2NtaS55YW1sIHRvIHJlZiB2ZW5kb3IgeWFtbC4NCj4gLSBVc2Ug
Y3B1X3RvX2xlMzIgcGVyIENyaXN0aWFuDQo+IC0gTGluayB0byB2MjogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDI0MDQwNS1pbXg5NS1iYm0tbWlzYy12Mi0NCj4gdjItMC05ZmM5MTg2ODU2
YzJAbnhwLmNvbQ0KPiANCj4gQ2hhbmdlcyBpbiB2MjoNCj4gLSBTb3JyeSBmb3IgbGF0ZSB1cGRh
dGUgc2luY2UgdjEuDQo+IC0gQWRkIGEgbmV3IHBhdGNoIDENCj4gLSBBZGRyZXNzIGlteCxzY21p
LnlhbWwgaXNzdWVzDQo+IC0gQWRkcmVzcyBjb21tZW50cyBmb3IgaW14LXNtLWJibS5jIGFuZCBp
bXgtc20tbWlzYy5jDQo+IC0gSSBub3QgYWRkIHZlbmRvciBpZCBzaW5jZSByZWxhdGVkIHBhdGNo
ZXMgbm90IGxhbmRlZCBpbiBsaW51eC1uZXh0Lg0KPiAtIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL3IvMjAyNDAyMDItaW14OTUtYmJtLW1pc2MtdjEtMC0NCj4gM2NiNzQzMDIw
OTMzQG54cC5jb20NCj4gDQo+IC0tLQ0KPiBQZW5nIEZhbiAoNyk6DQo+ICAgICAgIGR0LWJpbmRp
bmdzOiBmaXJtd2FyZTogYWRkIGkuTVg5NSBTQ01JIEV4dGVuc2lvbiBwcm90b2NvbA0KPiAgICAg
ICBmaXJtd2FyZTogYXJtX3NjbWk6IGFkZCBpbml0aWFsIHN1cHBvcnQgZm9yIGkuTVggQkJNIHBy
b3RvY29sDQo+ICAgICAgIGZpcm13YXJlOiBhcm1fc2NtaTogYWRkIGluaXRpYWwgc3VwcG9ydCBm
b3IgaS5NWCBNSVNDIHByb3RvY29sDQo+ICAgICAgIGZpcm13YXJlOiBhcm1fc2NtaTogYWRkIE5Y
UCBpLk1YOTUgU0NNSSBkb2N1bWVudGF0aW9uDQo+ICAgICAgIGZpcm13YXJlOiBpbXg6IGFkZCBp
Lk1YOTUgTUlTQyBkcml2ZXINCj4gICAgICAgcnRjOiBzdXBwb3J0IGkuTVg5NSBCQk0gUlRDDQo+
ICAgICAgIGlucHV0OiBrZXlib2FyZDogc3VwcG9ydCBpLk1YOTUgQkJNIG1vZHVsZQ0KPiANCj4g
IC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL2FybSxzY21pLnlhbWwgICAgIHwgICA1
ICstDQo+ICAuLi4vYmluZGluZ3MvZmlybXdhcmUvbnhwLGlteDk1LXNjbWkueWFtbCAgICAgICAg
ICB8ICA0MyArDQo+ICBkcml2ZXJzL2Zpcm13YXJlL2FybV9zY21pL0tjb25maWcgICAgICAgICAg
ICAgICAgICB8ICAgMiArDQo+ICBkcml2ZXJzL2Zpcm13YXJlL2FybV9zY21pL01ha2VmaWxlICAg
ICAgICAgICAgICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL2Zpcm13YXJlL2FybV9zY21pL2lteC9L
Y29uZmlnICAgICAgICAgICAgICB8ICAyMyArDQo+ICBkcml2ZXJzL2Zpcm13YXJlL2FybV9zY21p
L2lteC9NYWtlZmlsZSAgICAgICAgICAgICB8ICAgMyArDQo+ICBkcml2ZXJzL2Zpcm13YXJlL2Fy
bV9zY21pL2lteC9pbXgtc20tYmJtLmMgICAgICAgICB8IDM3OSArKysrKysrKysNCj4gIGRyaXZl
cnMvZmlybXdhcmUvYXJtX3NjbWkvaW14L2lteC1zbS1taXNjLmMgICAgICAgIHwgMzE1ICsrKysr
KysrDQo+ICBkcml2ZXJzL2Zpcm13YXJlL2FybV9zY21pL2lteC9pbXg5NS5yc3QgICAgICAgICAg
ICB8IDg4Ng0KPiArKysrKysrKysrKysrKysrKysrKysNCj4gIGRyaXZlcnMvZmlybXdhcmUvaW14
L0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgIHwgIDExICsNCj4gIGRyaXZlcnMvZmlybXdh
cmUvaW14L01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAgIHwgICAxICsNCj4gIGRyaXZlcnMv
ZmlybXdhcmUvaW14L3NtLW1pc2MuYyAgICAgICAgICAgICAgICAgICAgIHwgMTE5ICsrKw0KPiAg
ZHJpdmVycy9pbnB1dC9rZXlib2FyZC9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgfCAgMTEg
Kw0KPiAgZHJpdmVycy9pbnB1dC9rZXlib2FyZC9NYWtlZmlsZSAgICAgICAgICAgICAgICAgICAg
fCAgIDEgKw0KPiAgZHJpdmVycy9pbnB1dC9rZXlib2FyZC9pbXgtc20tYmJtLWtleS5jICAgICAg
ICAgICAgfCAyMzYgKysrKysrDQo+ICBkcml2ZXJzL3J0Yy9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8ICAgOCArDQo+ICBkcml2ZXJzL3J0Yy9NYWtlZmlsZSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB8ICAgMSArDQo+ICBkcml2ZXJzL3J0Yy9ydGMtaW14LXNt
LWJibS5jICAgICAgICAgICAgICAgICAgICAgICB8IDE2MiArKysrDQo+ICBpbmNsdWRlL2xpbnV4
L2Zpcm13YXJlL2lteC9zbS5oICAgICAgICAgICAgICAgICAgICB8ICAzMyArDQo+ICBpbmNsdWRl
L2xpbnV4L3NjbWlfaW14X3Byb3RvY29sLmggICAgICAgICAgICAgICAgICB8ICA1OSArKw0KPiAg
MjAgZmlsZXMgY2hhbmdlZCwgMjI5OCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IC0t
LQ0KPiBiYXNlLWNvbW1pdDogNjY4ZDMzYzlmZjkyMmM0NTkwYzU4NzU0YWIwNjRhYWY1M2MzODdk
ZA0KPiBjaGFuZ2UtaWQ6IDIwMjQwNDA1LWlteDk1LWJibS1taXNjLXYyLWI1ZTlkMjRhZGM0Mg0K
PiANCj4gQmVzdCByZWdhcmRzLA0KPiAtLQ0KPiBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNvbT4N
Cg0K

