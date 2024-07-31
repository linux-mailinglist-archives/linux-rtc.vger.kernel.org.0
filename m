Return-Path: <linux-rtc+bounces-1638-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C29CC942DF7
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 14:19:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F8141F2505D
	for <lists+linux-rtc@lfdr.de>; Wed, 31 Jul 2024 12:19:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E621AED46;
	Wed, 31 Jul 2024 12:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="eKw+sXCi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010059.outbound.protection.outlook.com [52.101.69.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 225E62E40E;
	Wed, 31 Jul 2024 12:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722428315; cv=fail; b=sQHSr7fHiboJ/CvRWu27FTI64H7VGmfXP173q/gcNStmek4CliTKWVKn8FTwJezl/JzQ0+94nuF3oFvXou7RnJgAjeANc2S7K99/HZTJBCOFLWoH/eO7vHLbg3MzE6K0V1mphp1ZL/ItRx8zwTLDpqR9jZAyMXs7j2GMdOfCscQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722428315; c=relaxed/simple;
	bh=OFt245eJlJlnFD1XD5rSs5TnzQIRUl8kYBw4sCzHWDM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Zh6quxdrjuE4I3pwTrmxoF1NSc178oKRyvC3oL1oyoShEVw2ByPL3YSZQmmLaZfbEkppt9BdtoetHxBXamy/7YXgQ7rJ+vVPytdUrdXKemJ8rnAemRPcWluXKZJ2SRjcO3sVBt/qgFWq2HUyqXYV43KSE9E/TNpdhpRw4TZ0Fs4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=eKw+sXCi; arc=fail smtp.client-ip=52.101.69.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRAt5fPJd/NhYVnuQ0xHhCkGb8j7yJVPxoLNEc8fe5MmAbEfja1vNJNzGqLVsOl0PwLET/xvLmHd7TLx6E94AWmHwg3CMoNhm2n859Bk1WvIfVDNdrwTtPSwJag+rCiS+TxwK5yWSlSGikgEwOOpR7g03EYV5qHntldsROOlJb5G3Y/HtTF1IILnoqZYzAHVSfWPwpJ5q1UhGEUK5+scgDZ0CSZeGCOisV4rRKN8FJiMClEizn8qGg9hZ+8i3zppYMhxtb+eRSwblMeBXacgStkH+Z8EOrC+TUE2lWf67GDI3ucC59NXtgzJZzr30mFQy8oOGD5ILtBI2sWpPq2h3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OFt245eJlJlnFD1XD5rSs5TnzQIRUl8kYBw4sCzHWDM=;
 b=UkYqEpvqAyBS2aFClNZwKBYMcfOPpi954mzF2YVxgflWNW5twj4mTAzMEWNa+BrZHjjgIOHaTWIQP3P2YTBeWUJRsPINM6xVSj46cuEohi/skvkm8o9YEkkRL5cNOhoYQxLfSMgo9ya7B8kTqfPEY2rQzINTZdtvjSdKs6VfN5c6Z06U2SXMEqmGiA3hzNX/OHjX1QgE7QqmJSzaCn5C3fLp2rZcWucvfnljOuGczyoiXLG74kRWqsrvWv1zcHGWqeu2eDvUWCP/3kh4oj7vf7kAD1NUfBDUBQfejZzJtASY7E46wHXnT2/Ef8ixLyDPpDdvMefk0ydfs2buNP0tAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OFt245eJlJlnFD1XD5rSs5TnzQIRUl8kYBw4sCzHWDM=;
 b=eKw+sXCipKgdH6bWOOQ3rlRK2nTnsCXIHHl5CZtZPQVyn3+n8B/m4+rXcnAXkVEMUBP4IskFRoXniv3G1qlx/FZ0W2gNDGUcG84+Dq5QyCbqzDKK45euE2q5zX6VJRDWuDeBjtAzvE3AFDGJMXE2K/989RvjjZEpaIaOFcTMxKqgHzJQRiL/VXpPvEG/a/KmCoIkeTfh2qSYjfsSeZnhvC/5KxM2kjvQdxcT1JhDLczjv8wctdTTkY5OIrGpALxYBgnAJgFsT909p2nRgan0IlIxTwoBRpcuGKcRaKHZ09ACypH5Tgaf/weJar1JBsogCmi+G8mbL+l3+W81vieTIw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PA1PR04MB10867.eurprd04.prod.outlook.com (2603:10a6:102:483::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Wed, 31 Jul
 2024 12:18:28 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.7784.020; Wed, 31 Jul 2024
 12:18:28 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "Peng Fan (OSS)"
	<peng.fan@oss.nxp.com>, Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi
	<cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Dmitry Torokhov
	<dmitry.torokhov@gmail.com>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
	"linux-input@vger.kernel.org" <linux-input@vger.kernel.org>
Subject: RE: [PATCH v6 1/7] dt-bindings: firmware: add i.MX95 SCMI Extension
 protocol
Thread-Topic: [PATCH v6 1/7] dt-bindings: firmware: add i.MX95 SCMI Extension
 protocol
Thread-Index: AQHa2OS7+2aa3wQFTUOvpCXejm2gC7IBNFWAgA+fxyA=
Date: Wed, 31 Jul 2024 12:18:28 +0000
Message-ID:
 <PAXPR04MB84592DE4592FC5D270F0820B88B12@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20240718-imx95-bbm-misc-v2-v6-0-18f008e16e9d@nxp.com>
 <20240718-imx95-bbm-misc-v2-v6-1-18f008e16e9d@nxp.com>
 <dee6e871-daa3-4886-be57-e4d4b3fa198d@kernel.org>
In-Reply-To: <dee6e871-daa3-4886-be57-e4d4b3fa198d@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|PA1PR04MB10867:EE_
x-ms-office365-filtering-correlation-id: e5a18738-f42a-4fe2-49f9-08dcb15ae25d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Q2N4MHhMUXVqOG1GdmdDbXRlTE0wUjRXcERPN2h2dENFM3lSRVV3RHdlaU50?=
 =?utf-8?B?RjcvQlRMcU12MnlVYVVNY2wxV0JkQjhtWWt2Q25LM3gzQjVWSTAyc05nQnls?=
 =?utf-8?B?RC9hTHEwU3RrTE5zVEo2eGtKYmdPVVRjMGtjVHFKRlRwLy9HdXVKL2xFVmU4?=
 =?utf-8?B?RjAybnk1cGNmbTlsZEZsNUFSYmJDUjQzZzE4cWduaDBTOFVXUElBN0RPQzFz?=
 =?utf-8?B?U3BlaGEya2FQYUhhck0xdGZPenpTVFYxT2N5L3hFYzFFWEYrZzdoWGpBaTdK?=
 =?utf-8?B?ek9ZMnZLNjFOdlF4Z1RwS1Rka0dXSEJJSGVhZHEzTEJVMTd4V0J4Z1dld1BQ?=
 =?utf-8?B?aVVFa2FwZlFIMVRVc1hKQVVoVmpzZVB4ZmZOOFgrbFhCQUk1MzQzdnlTN291?=
 =?utf-8?B?aTVqK0ZQS09ZeHJSVHpQZjlRdGowL25KcVp0bU14dTg2V1FtekpidVFQMmRp?=
 =?utf-8?B?bHh6MlhWblJaSnFXZHhiM253TTMwQXBINGdxQTVWTzAyMnlxZFprVUlQOTRZ?=
 =?utf-8?B?NDNIU3FVL2o2ai9tZFRqTGI5Uyt4NVVzQTRsQXFOczFmOFlJdURxbEF6SW5j?=
 =?utf-8?B?a2pUcHBiR2svWm1ha0p5NjdCbUpIWGxzL1lPZFJGK2RydEV3OFoyWWpZVnRZ?=
 =?utf-8?B?MDhPc0p1RmpnSmI2bmZDWkF6MXRIb1E4YVVwNVd2dU5uQ002RWNSNm9SM2Vy?=
 =?utf-8?B?MnhzWGFERjdvRzFCVjdibVFOTkNCNG40cHdJNWxBc1ZhZ0tHeE8vWm0vOTRi?=
 =?utf-8?B?MjRwaktHRVl6RU45VDNnSmtmWkFzcHpqSGdXU2Vvb2xHYmROLzMwZVdJSnNx?=
 =?utf-8?B?MDNTVFdNRGd0a2pXNE9jdExqU0U4eENsVFYrb1NaV25HU1YzSnpHL3pyLzlP?=
 =?utf-8?B?WU44Tm01TjJycGU5NnpvcGFUR3plSS9Ua2RCUmVVb1plWHhML2l2dDJZUmVN?=
 =?utf-8?B?ZEsxeXVua3YrT0VueGY5UmFFUS9kNTkvVFN3Z2xoeUdNdkpNMGt4NEJtWERK?=
 =?utf-8?B?YVk0blhxRGxKRVpGaVpjbkpwOTJtZVk1ZThobHFSMGlJRHZYSUY3dGdQdS9a?=
 =?utf-8?B?WmkxUVQ3NWl1TkZ3NCtwUkZ2d3I5UGlEWjVEbm40UlQ1Sk00ODd0cU5Lejlj?=
 =?utf-8?B?Q0d1UlZKMkF6YnB1YUhGai9NMVdyMGc3YmNPMlRSOXVOV05zMzBJSlJXVnpY?=
 =?utf-8?B?MWxKQTNrODhjZTRwZGY4L3VzQkRoTkEvcENDd0lINDRLeUh2dVl4ZzJyQ2VE?=
 =?utf-8?B?Zm5UWUxna0hjcFF3ZHlkUm4wdWx1akgvaWxpTWw4YzcvY3pHdjk2V2pjUEdU?=
 =?utf-8?B?OXMzN3BxZ0RZbnJ3OENOOW5PTlR4c0JDOE9NVXRxdTYxVzZyU21rd3pqQnov?=
 =?utf-8?B?OExhNFVKSFRaUlkrUmFvQU4rQkNtbi83aldKZEVxaVc2cXBRZGl2bnVjUG1J?=
 =?utf-8?B?VURIOWdBWGR6cUhCNFlOWUxGVVZiR0JzMzdMNmd5b2VIUFAxRitFdm1PN2gv?=
 =?utf-8?B?bjdTYkViOTVSd3hFa01mbmhOSm0ybHJ5R0IyNGVmQ0tKQzJ6VlRIcG1FRnM1?=
 =?utf-8?B?bGlPcUtYL1hjZWRtRm1QV0YxRkVWcFg1aGYzWkcreDIwMmNHd0M0d2IwRk5I?=
 =?utf-8?B?dUUwUDVhbi9VQmJGMDhHN1RVeFVvU0huQjByL0F5czlRR1NnU1lINFVaQzI3?=
 =?utf-8?B?S2d2NHJsdDdaMjdlT003bzRtbmxnbyswSnJ6SkRHVUtLczJXN1RXTlMrdmk5?=
 =?utf-8?B?dTZ4L2pPYW9ZUnUvTHFxMU91MUJ1bDJ4TXI0S2ZGdDgrZEpsSDd6bGN0TVJW?=
 =?utf-8?B?dnFCOHFSS2RyWjZteHJvOVpMY2ZxQlozS0NnZUg3a3FHeld0bHZDSU1qbURM?=
 =?utf-8?B?Q3RzUGhHcXFyQXc2cGVXaXhEQmxneDhSUWtscVo0b3hYVEc0UGQ0eEtjTEF0?=
 =?utf-8?Q?hCnfiwOVEEU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RVV6ZEpUUHB3WitwdmlGdU5sbkRFdGEvdlh3MnJQL2FUc1pjSTQxUmR5ai93?=
 =?utf-8?B?eUwyZVdzV2JOaXRnQS9LUjVJQnNxY0QydkRwMWhZQjNSM05QMTBYS0RrSXh6?=
 =?utf-8?B?enFLNGhqalJvOERBcmhkZWdJeDdyUWxjbzdwV3RpRFdLaVZHU2IyQnljTFBn?=
 =?utf-8?B?eHVPTlNXMVQrK2dCTk9oV3RERloyR2lkZ29HZlJQRWJTRElyWEh1TjZ3STdj?=
 =?utf-8?B?dkJkQzYvcVladE91RTJ1blB2YXZJQ0xFTUNpdHhIYzVtc2xUaWQxWDcxYnFt?=
 =?utf-8?B?TlAyUHM4cUJLNHNVU3VpT25iY2U1MTUwUEV0ZHR5aUtMcS9nVkYzZzFoQWpM?=
 =?utf-8?B?K1lJL3Q1YXhCYUxKZVprdVgyQW0zU1ZTS0Y4MzJRcnFHa2R3WWk2ekNlZ213?=
 =?utf-8?B?SzlwSGh4eFpZZkEvb3paUEs0UEtSaU15dWdCZ2E1c3cydEtXZUZLZFdQVEc4?=
 =?utf-8?B?bm5OclZCTjdtQVQ0NVF4bkZ3T2xxaWtTVkgvdnJtdzc0QUJaWHJjeHFRMm9y?=
 =?utf-8?B?V0QrUCtpK0w0TjZoTUpieFF1NWxjWjFVeGFzMG45VGVlY3k3T005NE1EcVVT?=
 =?utf-8?B?NXlkR0hPemNtS0dWR2ZWU2dRSXlOSHBoU0psN1BFL0llZ2VIcWU1dnlmZzVx?=
 =?utf-8?B?cWVWZ3VzV0FiYllIN3pWVk5tU21YdGJRREhSKytrejFzMGlzWHhzeXlqV3ZS?=
 =?utf-8?B?TFhISXlyN3ZMc0FCYmRqYzdraDdhVGNLTVN1M2dnU3dGQ3c3Z3pON2tncU1u?=
 =?utf-8?B?SVFlYlhnb0FGT01wcG5QTEs0MjhXd284Y1VLbFl6N3Z2VlA4TUVpSVN5UTcx?=
 =?utf-8?B?b2U1Vnk4MTN4SndSbUo0SmRaWVNKYndOYTBER3o2djNuYTRFU3RYcUsrZ3da?=
 =?utf-8?B?b0hNU1Y4a1NQcWxneW50ODZkSEFJNk45MWY5bnlPbHlXOFFSQ25rM2NTY3F3?=
 =?utf-8?B?VytGTjVzdzlOcEZOTTlQRkNKM0QraDFUenJDTjVpeFdMcXpZdEYzQ0p2RGc5?=
 =?utf-8?B?RnRmRSthc0tHVkIvaDJPOTR0em9uM3AyRWhRTFRwb0hYVm9xNTJiTjhneDJr?=
 =?utf-8?B?U3JJL201SU9UU3hOQWlncEZ3TnlWWVFvMWVEcVA3d0h2cVhEbVBPV3lLTUs0?=
 =?utf-8?B?aFk1UkhBZTlYYmd1cGFIdUlDT21HY0RqdjRlL1hhMmR0NGllR1pjclMxbkxE?=
 =?utf-8?B?emJWVCsxWlZLR3JPVTBRT2ZqakpScmlSTGNKcjN1YncrbUszNmxpMXVCS3dH?=
 =?utf-8?B?alp2Tjg4QzcxOVphQnhJRHdoaVNtOFFxaVBIYUl3T2s5M3hGbW5iVjU1T1Zy?=
 =?utf-8?B?V0JHTXM0SWViY0o5UFlGVG1MMk1EajAzQ0dtZ3NmQzZJc2RQN0xzUlJWanNw?=
 =?utf-8?B?WFVBaktOY3UzM0ljSldTM1U2bWI2MjhwWFdDby9ZdnQvWFNyeGRZUGs2ckVu?=
 =?utf-8?B?VWhjTHk4ZHVYa21odG5OaC9PU3pTZFRwWVA0ZU1wMHpUQWluRWV0VFJkZTZq?=
 =?utf-8?B?NlFIQy9SVlAzZ3d0c3FsVThPTHlFak92dElLLyttclc0QlNmMkRJcklSWXgz?=
 =?utf-8?B?Wmh3U0Yva05kQVY1Q2YrQnZ6aUU5WXpXLzBuWkNVZ0xGdm9GQWRRWGFxY3pL?=
 =?utf-8?B?VXF3UHhpY0VjZWdZaWlxS3doNzN6WEFBMGpaSWN4WVNtWWh1V0FQUU5IVFVP?=
 =?utf-8?B?b0xDbGY4VTQ3d09FT0JMcURSUDkvVDBsYzNvcjdxWDFyWUZHZUFIN1pHVldv?=
 =?utf-8?B?WWI5ak1nb1p2NGVwMmVHOUNxakpuNVVWMXYyZHIzcWtjUmZvOHZReGpGTk5P?=
 =?utf-8?B?M1FYSTJFU01pWkIxQlNZdk1EbnBIbHFjdnV3VVR4ODRtNHB2LzJ3czZpejh4?=
 =?utf-8?B?N0tIWWZsMHN2NTZhbUxNVVQ2N2JKaituZHhKVHZKamdVZm1rMlhIWDJjZno1?=
 =?utf-8?B?d1A1bVhOM2R3Q1pPa25qRFdHdlFSb2Y4cUF4czVoVzlPMDc0akQ4TTFTbG5x?=
 =?utf-8?B?U0J5SzVPVXRFbE9ZSDlBMkU4RDZiU0s5d1kxQnNjMWdmWWdDN25qNndOQlRv?=
 =?utf-8?B?a3JtN091aE9sUmp2M0xtb1p1OENBdU1nYnhGZ0tVQjJwNXJYRDkySGYyTU9y?=
 =?utf-8?Q?PeYY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a18738-f42a-4fe2-49f9-08dcb15ae25d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 12:18:28.2568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qNOWai9Xvyzc/g5MTliVLkMMmuSi5JXjH2UlUb8tCn94XoMinsiI+JQfF33Ap9rcKaQjWsU5oOV9nOHQaUUR1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10867

PiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDEvN10gZHQtYmluZGluZ3M6IGZpcm13YXJlOiBhZGQg
aS5NWDk1IFNDTUkNCj4gRXh0ZW5zaW9uIHByb3RvY29sDQo+IA0KPiBPbiAxOC8wNy8yMDI0IDA5
OjQxLCBQZW5nIEZhbiAoT1NTKSB3cm90ZToNCj4gPiBGcm9tOiBQZW5nIEZhbiA8cGVuZy5mYW5A
bnhwLmNvbT4NCj4gPg0KPiA+IEFkZCBpLk1YIFNDTUkgRXh0ZW5zaW9uIHByb3RvY29scyBiaW5k
aW5ncyBmb3I6DQo+ID4gLSBCYXR0ZXJ5IEJhY2tlZCBNb2R1bGUoQkJNKSBQcm90b2NvbA0KPiA+
ICAgVGhpcyBjb250YWlucyBwZXJzaXN0ZW50IHN0b3JhZ2UgKEdQUiksIGFuIFJUQywgYW5kIHRo
ZSBPTi9PRkYNCj4gYnV0dG9uLg0KPiA+ICAgVGhlIHByb3RvY29sIGNhbiBhbHNvIHByb3ZpZGUg
YWNjZXNzIHRvIHNpbWlsYXIgZnVuY3Rpb25zDQo+IGltcGxlbWVudGVkIHZpYQ0KPiA+ICAgZXh0
ZXJuYWwgYm9hcmQgY29tcG9uZW50cy4NCj4gPiAtIE1JU0MgUHJvdG9jb2wuDQo+ID4gICBUaGlz
IGluY2x1ZGVzIGNvbnRyb2xzIHRoYXQgYXJlIG1pc2Mgc2V0dGluZ3MvYWN0aW9ucyB0aGF0IG11
c3QgYmUNCj4gZXhwb3NlZA0KPiA+ICAgZnJvbSB0aGUgU00gdG8gYWdlbnRzLiBUaGV5IGFyZSBk
ZXZpY2Ugc3BlY2lmaWMgYW5kIGFyZSB1c3VhbGx5DQo+IGRlZmluZSB0bw0KPiA+ICAgYWNjZXNz
IGJpdCBmaWVsZHMgaW4gdmFyaW91cyBtaXggYmxvY2sgY29udHJvbCBtb2R1bGVzLCBJT01VWF9H
UFIsDQo+IGFuZA0KPiA+ICAgb3RoZXIgR1BSL0NTUiBvd25lZCBieSB0aGUgU00uDQo+ID4NCj4g
PiBSZXZpZXdlZC1ieTogIlJvYiBIZXJyaW5nIChBcm0pIiA8cm9iaEBrZXJuZWwub3JnPg0KPiAN
Cj4gV2h5IHF1b3Rlcz8gV2hpY2ggdG9vbHMgZGlkIHlvdSB1c2U/DQoNCkkgY291bGQgbm90IHJl
Y2FsbCB3aHkgaGF2ZSB0aGlzLiBJIHdpbGwgZHJvcCBhbmQgcmVzZW5kIHRoZSBwYXRjaHNldC4N
Cg0KVGhhbmtzLA0KUGVuZy4NCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KPiBLcnp5c3p0b2YNCj4g
DQoNCg==

