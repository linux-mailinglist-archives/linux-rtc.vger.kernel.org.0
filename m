Return-Path: <linux-rtc+bounces-1375-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C0670911C3A
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 08:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75B4D285AC2
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 06:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5018A16C69C;
	Fri, 21 Jun 2024 06:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UniJaokW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2085.outbound.protection.outlook.com [40.107.22.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D0A169AD5;
	Fri, 21 Jun 2024 06:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.85
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718952965; cv=fail; b=hdm2y9RfqRRNRIq9vulSnkbC4rCLBmQi5D/t2hzMQxRHbf4ilak59VcaEyOV0WqI0OiQX7qpgsaBuw9r20xcem6d0GJybC+f44iecjBjOFT5OhFc0Qn0k6EaTttyGtaV5GpDBXTFLrHXfWq3ZvlN+lOoTAx6glstBSHNmS01Jo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718952965; c=relaxed/simple;
	bh=xR9UW4Jdz0yuYEI1aBoF4HryZ/pqGfpyfS/4R150Ms0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IZTI1lpVma/Lsf8xgLZJ5+c1FaAhBLCUsIQuzmhkdTQAzuAT/aJDcchUFFfrYFqhsilSu6B6aLK9bnG7nZlBkn3GyTrof2r5P81N/bn4dGBkijMh1QxMyDxfiLdmtkLrqY0d84kfKV/GAJlaqoUjS57PdfhoqwNwUW922Ec6UcY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UniJaokW; arc=fail smtp.client-ip=40.107.22.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dTVE9j7jQCTeuWuTkUx31QNKXDr+geqw6ldGCHszBZGIzJxRiKRtiSoic1YQv2zFJfeym+D+DZlq70e3pWComRUurGj3ByAHXPeJweAB5kFh25qeRpPx0itEmUvsaNV1Tgk8CIo9mnWZZ3hegDdzEFUGU2pLz19O+SyoXRDNcyT6uV9autFRjT+ece646aoUKCnb0S6iLF4r9wB3/ahpNjKTheCXIz2abZQqIZZoOI4Nt4Hs4uKuy7GHSmESkG9Wy+2IOuOzsd35+9nPIvfs0jmxiI+p4aGcaqXqgK7kmUJVAu/n8KfQ4naiqMakErguf7cy2NAWDNkqGnKsFW5oBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QAZe/XpfLU5x78InrIRx8wxQbwTt+69hCuXdxwFNfvE=;
 b=L1wL5Xe0L7vV5h80SZoiSuHHkjIu0UYP+FDynKEbJpqTXRkUXEqMvrmiaq+rvWYhIJ6xYeYOBSzlas0bLQq3r04MylU+egs6Ql0Ehgtl+2FXKaUWD74Xm9ayiDZWfWcpzpvNKAw55Bac2o8QjRvZnj4Jt6FZLUESJD7KoA3QWx2HLFx3Xh8IKpct4YkgtM6dGMclYaNPA8pOq6SGEFP7O5CIlXhjMHSySnjR5zGAxB2oPDcnTvQnRBZO8yecmhF9hFh3bZrREYKHCeN3B824vfzynCKk12CAAXqR6c+0gyXuDIVVh8dTMWIv9b3QEudtiEJ0j+5+4b1tq008U7uDqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QAZe/XpfLU5x78InrIRx8wxQbwTt+69hCuXdxwFNfvE=;
 b=UniJaokWFDKFbSYo4N5FU2wvKZUtMOq8Q96++NZluMoEP49CP5DAykaTvQxeHIiTL0NXv9y9GW6gNoVyT4/nQqRKEF2aR7jRRx9iFYnw4BK1KLESHDy7/+w++BJ+5hE+PH7asOoSiYkJNNroTHodJjoCznOXpvwfSqpOyIcjlgQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by GV1PR04MB10426.eurprd04.prod.outlook.com (2603:10a6:150:1cc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 06:55:58 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%4]) with mapi id 15.20.7698.017; Fri, 21 Jun 2024
 06:55:58 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 21 Jun 2024 15:04:38 +0800
Subject: [PATCH v5 3/7] firmware: arm_scmi: add initial support for i.MX
 BBM protocol
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240621-imx95-bbm-misc-v2-v5-3-b85a6bf778cb@nxp.com>
References: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
In-Reply-To: <20240621-imx95-bbm-misc-v2-v5-0-b85a6bf778cb@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-input@vger.kernel.org
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718953487; l=13884;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=qf3BvGVUQfUDNPRd2U+n/wlDtywN4BIpyG9Mq65nrws=;
 b=apGCZPhiN53JTpgT+P0ea8VkUib3ZGs1/MDFvxRPwZFzc56zuBGpGfc3uEOJc26H+ook2OBsC
 BSe8I8sDFLqBtwVTzX2ytop69Tt7rmr5W5DeIlhW1wvfTDJvFMie9+3
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SG2PR01CA0122.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::26) To AM6PR04MB5941.eurprd04.prod.outlook.com
 (2603:10a6:20b:9e::16)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5941:EE_|GV1PR04MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: ec9fdc89-9fd5-41d1-06b9-08dc91bf33c6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|1800799021|366013|52116011|7416011|376011|921017|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZFA4WjhoQThNY0EvNlQwRXRjMFh4cGRHR2RPc0xuSGo3d2hQZnJ2STJ4bjRj?=
 =?utf-8?B?R1BHN2hmVFFZQ25iSWhEZHA1Zkp2Zmg2Q2NVQ3NWdnUzSzhrcUZaMkVLNEpC?=
 =?utf-8?B?bHZWQjFEbnc1VUEveUwvRzNnRTNCMFlvZjRTM1Z3QUM0SjlmQUtWRFJUU0FI?=
 =?utf-8?B?NVpPQ253N3dhSi9sTytCM3R2ejkvdjhhNUxsZnVkd0hIYStRcUFYM3VLdGRj?=
 =?utf-8?B?Zy82S1ZaN2liVldjQmNuTlNWUEdTODdIVTczbEQvR0hpVGhGQ0J0Z0dkUC8v?=
 =?utf-8?B?Z3VESGdyOVBZWnUvbk1jM3hsMkJpbmlvbTlPM0VMSE10c0VhNnJrcU1mRlhv?=
 =?utf-8?B?R0pWaktxZHQ2VDIwOG5RVlRSQlkzK3JRWUtQdGg5dllDUUluT2UxNE1iR21U?=
 =?utf-8?B?TWJscFhqMElmNXpxT1VQZHBMNm81TldtVEdkYnNkZWwvR0VZTUlTYURTTjVj?=
 =?utf-8?B?U1Y2WEt1c0NoakY4ZEFoaC9yRDNET2NxZHNFQm9ZV3dsbUFMV2M0cXdPSHJz?=
 =?utf-8?B?L2ppZ1I0NjhOVlA0UmxrdThmRGlSYUl4bDB4ajZKWE5oUG44R1ZkR2h1bUZo?=
 =?utf-8?B?alc0S01pSzdhaGNpa0tid1FCYzBMdng3ZUY5ZmVOeENNYyt2ekxzQkk0LzRH?=
 =?utf-8?B?TC91NVlRMHk2TlNCM3RoNXNqeTBUd1FqOFEyajdVUmZwbkcwZjRnK0pLL3M3?=
 =?utf-8?B?WFBYcjIxVzVMVW5USy9sclRmVE45b0NiY0U0NVZCT2JYcWlqRnRHbFVnSG5G?=
 =?utf-8?B?SHpZN0wwVmlWcmM2TUdEL1RMSDl5ZDdncTllVDlQNmpSc1ZHQjN6THk0RUsz?=
 =?utf-8?B?a0lRcEllMFlaajQ4dlV5S3M3ckhBWlRiRlZUcW5BbkNwWjd3SkFEcm9jNDJJ?=
 =?utf-8?B?akVrYjVNZ2hFSjJoS3N3dklOS3ZRaG5YR29TZ01JRHliaVFtNDBieHpVSVVo?=
 =?utf-8?B?amtUTWZwYWFCUC85eWIrZ0h0OXR0ZEF6NGMrdC9jM2ZrT3d2Rm1ISmtrL1JE?=
 =?utf-8?B?QXhORy9sZnpvTTlEcFhES05zRXRIMFhjRXJiS0ZXZ3cvOEF5ZXl1M2YxUDBm?=
 =?utf-8?B?V0hRREUrT1BydFhBWlk1VURidTV2QVFyUFNKOFNEQTlKM25lM1ltc2x6ZWVm?=
 =?utf-8?B?M0xmTHBzd3dxQ2lzS3gvT3NCeVlXakcyV1pBL2Y2aDZkNGswNlQ4NjFxOGEx?=
 =?utf-8?B?aWxsT3VIUkFaSmJaYTBIckpMcVU3WTBZZ2VjZ09SZ3VJTWlpbGl0V245elYy?=
 =?utf-8?B?dGthZmMyR0EwTGRHSGg2WVBoMmR1Z3VReStIVEcrdC9WYU0xemF6MlorK3NP?=
 =?utf-8?B?QitxL3VPczc0MlZOdXpia21zb2JEZkRRMXRoNSt6b3NFYi9uVlgxVVVaM3Fu?=
 =?utf-8?B?SUNLR1V1bEl5K0JydnQyOUY1SXYzSkthTy9MeVo5UUJVdjg1VTFiRzVpZ0FI?=
 =?utf-8?B?T2tGNWZESW9wajJJKzA1RVBsVitHbzZRYlVZOVlub2xCYVRHMXVXaTdnNlBm?=
 =?utf-8?B?RXNmMXhMZWVMV2pGUVRXRHFMTHhjU010dU9kNUxlNEo3YWhNa2RRYUlmZWhz?=
 =?utf-8?B?cThpUE9TckNyU1RsaE1UTC9LaHhGOHNCSFBYaTJKZVJ4MFB2blcycVc4Y09l?=
 =?utf-8?B?Ti9Lb3BmNEd3YVlnTzBTVXZWUWVaVHNSOHhVcXpNaEhRQWtRZkJsY2lJNnhy?=
 =?utf-8?B?MFpXdGphU2p3ZGpTS2w4SzlNWERKN2NqZE43Z0NwTDZQQnR6YmpxcjBtSHho?=
 =?utf-8?B?NjRwOStBbVlERGxQdUZxamtCT2FiVE5rekg4RWxDdUthY3Z6YU9UL29YdGow?=
 =?utf-8?B?SmJzVHhrV0lOaHk2VTA2Y2NLSzFpaXI2Zmk4WnFpNkkzZzk4ZXRIMlI3dlpY?=
 =?utf-8?Q?CGm9lQ9PJXNUF?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(1800799021)(366013)(52116011)(7416011)(376011)(921017)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q2UyQ0J4d2JFOFc3dCtJWVVwdndTYkVFMkhCdWtwTHdPTzZOK1RmMWFZKytN?=
 =?utf-8?B?enFvSUtEVTd0VEtNdjVRSVUzZVl1YUZoUzdXcVhmY3FQZm9KNlBKMG56NzFo?=
 =?utf-8?B?TjUwekNGeDRML3YrMjZCcXlGUlk2UDl3RFpUOGVqQzFHSlpVMTZGNEhPczFy?=
 =?utf-8?B?ZWROcnRCR1NhZ3ZrSkMvdi9yT3orbGhWYzlUaG0zSGlFV053ek1PdlRjL2FG?=
 =?utf-8?B?MmZXZjFVUUUzallTcDhoNEl3M1lnSjNzb1puL1NCZXdyeE5hcElrUUI1cFJo?=
 =?utf-8?B?N3R5YWRNUEJLeUdyVXIrT3ZLOGNzYUJHVnQxY2FTaUUrU0FYOWsvYkEzdjN2?=
 =?utf-8?B?dFVrYzZlMC9WVW5WRXZrbE03d3ZwdFlhcjdyanhZcFowVWVnUE8wY1pRQmJ6?=
 =?utf-8?B?dENOd0Z3SDRkUmc1MVhoUEJkOXBOYW1oUW02bXBOSkJWa3d2MVRWc2xzYW1J?=
 =?utf-8?B?ajdpMThhZlVMTUNTdHZQSkFQam9USGlyUnUzanlTQnRDTmtpTmQ5bFdzV0JF?=
 =?utf-8?B?MjhuQzJwYXRmV1VSYnlkS3ZsbVZxQ2hwQ1Myd0tHTTRPNkdnK2Z2T3NDcWxp?=
 =?utf-8?B?ZDVwSUYxQlJYOTVBaDN2ZVFzOXdvV3dVT2dBQnNCanFrZmpYQ2JlSHRJS0Vp?=
 =?utf-8?B?ZVAvVzB6LyszZWNmbXhIUmljWTRQdzFxZG9WYXRKOTNnSUtmVXBvWHNVY0lU?=
 =?utf-8?B?ZDFwY2N5cDRZZ0pGZE1kY2k4VDNOdHYyZ2dvZHJjNFpTKzRlMWNLbFNhZWl3?=
 =?utf-8?B?blc4N21zUWx4ZDgwSExpaUJXM0ZnVllyT1EvRnlXQlUvZ24yUG5NcnV6ekdC?=
 =?utf-8?B?S1pEUCtVcWVhN3BFVExCeUt2b2hmS0lJWFpsdFJ4VVdHeUN1Rk5QejhvTTV5?=
 =?utf-8?B?aURFWXdkcmI5OG1salZaMjVoR1VWbjVEUUpETW42VU9WRllHdlpBTUozVi9m?=
 =?utf-8?B?UG8wQk8yYmIwbVVEVWEyaTZFczNjd253WHV5QWJQTTFFdmdsNW5SUk1kaWhS?=
 =?utf-8?B?NnVzRFBLUnYvQTIzRTZuOEM4eG8rNzNVMjFlWTIxVmRLQUUwSE8xc0d3TEJu?=
 =?utf-8?B?OEhpMEVwNTJtbHBxT20vc2wvemphS0VSRjRhU1BRTUJib09uQ2s4Tnk0emwv?=
 =?utf-8?B?aHlKbzZINFN6NTUyczFHRXh3cWVkUktWZnphTWw5TUZsaFc5ZHZzSUtrbHlz?=
 =?utf-8?B?c3ZrZUhVaThad0dMekJIKzVMcUttdDJqUHBpZVhYYi9RS2xGakUvdHRoMFY1?=
 =?utf-8?B?ODFBdUdzL1FPUW1UbWR1dWJMZ2RXbm81N2hnL0J6cng3VzQwM21GR2E4SUJK?=
 =?utf-8?B?dnpRZW9MT2RSWS9JTlpmRS9zRm0ydjMzaFRvc0hVYlgwcEhxd1pPc25RV3Yv?=
 =?utf-8?B?cDZMMWdCVGlKK3c4eld2SVB1Ulg2TVRqdTR2T2NndkhNZ0xKRHVEWmRKeFBD?=
 =?utf-8?B?VzhiZHRwQnFGNmxHM2RrRmtCMzJtekhudlVhNWFXUVFuR1g5SE5FakdDNGpj?=
 =?utf-8?B?MUd2aXptVVBvZlNLR3UyME0wNVBEM2t1T1lkRVVqaTlTZmVFS01DYXdWTGJC?=
 =?utf-8?B?YXIwVktXQWdQOVVlM1NjSTlLb0tzL0txRHhhSlh0MFdWaWZod2xLcy9zQmh1?=
 =?utf-8?B?eWJYdzVPdW4vZDlFaVgwdzJaUVkwbFNwY1hOL2NSN3RMVk9TNVh4KzRFN25q?=
 =?utf-8?B?cnhpdkpRN204RFVLNEtVUEFlb1VPRDdOQ1RaNkdPWkRBT3FNWDZrYjZPRkI1?=
 =?utf-8?B?ckxIVTI0K3pvL0NCYnptUzNKNStEWC90MlRJbUJjZWNpdGNaSlorMmVzL3BV?=
 =?utf-8?B?ZUtlUkgxSmNoQlhxZlAwSi9lMlU4VmxoRHJCelp1VGo0SWFDSWNjbXZzWWpq?=
 =?utf-8?B?dWNMOGRFWDJrUzdXdml0VzlSUTlOV3hSTllHbm5DdGFlVTZYRnYrZEoxZjB6?=
 =?utf-8?B?aHNDNDkyTkEzc2JBVytRN04xdnR2UktPUit2S21USDFLZ0NhOUpQcmQxakJZ?=
 =?utf-8?B?QW80dmM2WTlPNi9KZzJHSkdHU3pZMGxWRUlOU2dqS3FsQzZMeXdDKzRoL1dt?=
 =?utf-8?B?TElIMU1vbWJzWk5kTmYxUjUyS1puYWwxS0VnZnNuTzZVVXFPWmkxeTkwNjNs?=
 =?utf-8?Q?ui4H+J/CYkvTC5s0evQku2PaJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec9fdc89-9fd5-41d1-06b9-08dc91bf33c6
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 06:55:58.0997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4uqN5bj6nKMiormAF8k73VDuclKo1wu7XiINyI3v4LmK4at7QSo2cCW3Hs3UXH7uRYMzGqvyt6+KyoJzD90tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10426

From: Peng Fan <peng.fan@nxp.com>

i.MX95 has a battery-backed module(BBM), which has persistent storage (GPR),
an RTC, and the ON/OFF button. The System Manager(SM) firmware use SCMI vendor
protocol(SCMI BBM) to let agent be able to use GPR, RTC and ON/OFF
button.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/firmware/arm_scmi/Kconfig          |   2 +
 drivers/firmware/arm_scmi/Makefile         |   1 +
 drivers/firmware/arm_scmi/imx/Kconfig      |  14 ++
 drivers/firmware/arm_scmi/imx/Makefile     |   2 +
 drivers/firmware/arm_scmi/imx/imx-sm-bbm.c | 379 +++++++++++++++++++++++++++++
 include/linux/scmi_imx_protocol.h          |  42 ++++
 6 files changed, 440 insertions(+)

diff --git a/drivers/firmware/arm_scmi/Kconfig b/drivers/firmware/arm_scmi/Kconfig
index aa5842be19b2..79846cbaf71b 100644
--- a/drivers/firmware/arm_scmi/Kconfig
+++ b/drivers/firmware/arm_scmi/Kconfig
@@ -180,4 +180,6 @@ config ARM_SCMI_POWER_CONTROL
 	  called scmi_power_control. Note this may needed early in boot to catch
 	  early shutdown/reboot SCMI requests.
 
+source "drivers/firmware/arm_scmi/imx/Kconfig"
+
 endmenu
diff --git a/drivers/firmware/arm_scmi/Makefile b/drivers/firmware/arm_scmi/Makefile
index fd59f58ce8a2..fb9407fef60c 100644
--- a/drivers/firmware/arm_scmi/Makefile
+++ b/drivers/firmware/arm_scmi/Makefile
@@ -16,6 +16,7 @@ scmi-module-objs := $(scmi-driver-y) $(scmi-protocols-y) $(scmi-transport-y)
 
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-core.o
 obj-$(CONFIG_ARM_SCMI_PROTOCOL) += scmi-module.o
+obj-$(CONFIG_ARM_SCMI_PROTOCOL) += imx/
 
 obj-$(CONFIG_ARM_SCMI_POWER_CONTROL) += scmi_power_control.o
 
diff --git a/drivers/firmware/arm_scmi/imx/Kconfig b/drivers/firmware/arm_scmi/imx/Kconfig
new file mode 100644
index 000000000000..4b6ac7febe8f
--- /dev/null
+++ b/drivers/firmware/arm_scmi/imx/Kconfig
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "ARM SCMI NXP i.MX Vendor Protocols"
+
+config IMX_SCMI_BBM_EXT
+	tristate "i.MX SCMI BBM EXTENSION"
+	depends on ARM_SCMI_PROTOCOL || (COMPILE_TEST && OF)
+	default y if ARCH_MXC
+	help
+	  This enables i.MX System BBM control logic which supports RTC
+	  and BUTTON.
+
+	  This driver can also be built as a module.
+
+endmenu
diff --git a/drivers/firmware/arm_scmi/imx/Makefile b/drivers/firmware/arm_scmi/imx/Makefile
new file mode 100644
index 000000000000..a7dbdd20dbb9
--- /dev/null
+++ b/drivers/firmware/arm_scmi/imx/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_IMX_SCMI_BBM_EXT) += imx-sm-bbm.o
diff --git a/drivers/firmware/arm_scmi/imx/imx-sm-bbm.c b/drivers/firmware/arm_scmi/imx/imx-sm-bbm.c
new file mode 100644
index 000000000000..559ad9f7088c
--- /dev/null
+++ b/drivers/firmware/arm_scmi/imx/imx-sm-bbm.c
@@ -0,0 +1,379 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * System Control and Management Interface (SCMI) NXP BBM Protocol
+ *
+ * Copyright 2024 NXP
+ */
+
+#define pr_fmt(fmt) "SCMI Notifications BBM - " fmt
+
+#include <linux/bits.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/scmi_protocol.h>
+#include <linux/scmi_imx_protocol.h>
+
+#include "../protocols.h"
+#include "../notify.h"
+
+#define SCMI_PROTOCOL_SUPPORTED_VERSION		0x10000
+
+enum scmi_imx_bbm_protocol_cmd {
+	IMX_BBM_GPR_SET = 0x3,
+	IMX_BBM_GPR_GET = 0x4,
+	IMX_BBM_RTC_ATTRIBUTES = 0x5,
+	IMX_BBM_RTC_TIME_SET = 0x6,
+	IMX_BBM_RTC_TIME_GET = 0x7,
+	IMX_BBM_RTC_ALARM_SET = 0x8,
+	IMX_BBM_BUTTON_GET = 0x9,
+	IMX_BBM_RTC_NOTIFY = 0xA,
+	IMX_BBM_BUTTON_NOTIFY = 0xB,
+};
+
+#define GET_RTCS_NR(x)	le32_get_bits((x), GENMASK(23, 16))
+#define GET_GPRS_NR(x)	le32_get_bits((x), GENMASK(15, 0))
+
+#define SCMI_IMX_BBM_NOTIFY_RTC_UPDATED		BIT(2)
+#define SCMI_IMX_BBM_NOTIFY_RTC_ROLLOVER	BIT(1)
+#define SCMI_IMX_BBM_NOTIFY_RTC_ALARM		BIT(0)
+
+#define SCMI_IMX_BBM_RTC_ALARM_ENABLE_FLAG	BIT(0)
+
+#define SCMI_IMX_BBM_NOTIFY_RTC_FLAG	\
+	(SCMI_IMX_BBM_NOTIFY_RTC_UPDATED | SCMI_IMX_BBM_NOTIFY_RTC_ROLLOVER | \
+	 SCMI_IMX_BBM_NOTIFY_RTC_ALARM)
+
+#define SCMI_IMX_BBM_EVENT_RTC_MASK		GENMASK(31, 24)
+
+struct scmi_imx_bbm_info {
+	u32 version;
+	int nr_rtc;
+	int nr_gpr;
+};
+
+struct scmi_msg_imx_bbm_protocol_attributes {
+	__le32 attributes;
+};
+
+struct scmi_imx_bbm_set_time {
+	__le32 id;
+	__le32 flags;
+	__le32 value_low;
+	__le32 value_high;
+};
+
+struct scmi_imx_bbm_get_time {
+	__le32 id;
+	__le32 flags;
+};
+
+struct scmi_imx_bbm_alarm_time {
+	__le32 id;
+	__le32 flags;
+	__le32 value_low;
+	__le32 value_high;
+};
+
+struct scmi_msg_imx_bbm_rtc_notify {
+	__le32 rtc_id;
+	__le32 flags;
+};
+
+struct scmi_msg_imx_bbm_button_notify {
+	__le32 flags;
+};
+
+struct scmi_imx_bbm_notify_payld {
+	__le32 flags;
+};
+
+static int scmi_imx_bbm_attributes_get(const struct scmi_protocol_handle *ph,
+				       struct scmi_imx_bbm_info *pi)
+{
+	int ret;
+	struct scmi_xfer *t;
+	struct scmi_msg_imx_bbm_protocol_attributes *attr;
+
+	ret = ph->xops->xfer_get_init(ph, PROTOCOL_ATTRIBUTES, 0, sizeof(*attr), &t);
+	if (ret)
+		return ret;
+
+	attr = t->rx.buf;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret) {
+		pi->nr_rtc = GET_RTCS_NR(attr->attributes);
+		pi->nr_gpr = GET_GPRS_NR(attr->attributes);
+	}
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_bbm_notify(const struct scmi_protocol_handle *ph,
+			       u32 src_id, int message_id, bool enable)
+{
+	int ret;
+	struct scmi_xfer *t;
+
+	if (message_id == IMX_BBM_RTC_NOTIFY) {
+		struct scmi_msg_imx_bbm_rtc_notify *rtc_notify;
+
+		ret = ph->xops->xfer_get_init(ph, message_id,
+					      sizeof(*rtc_notify), 0, &t);
+		if (ret)
+			return ret;
+
+		rtc_notify = t->tx.buf;
+		rtc_notify->rtc_id = cpu_to_le32(0);
+		rtc_notify->flags =
+			cpu_to_le32(enable ? SCMI_IMX_BBM_NOTIFY_RTC_FLAG : 0);
+	} else if (message_id == IMX_BBM_BUTTON_NOTIFY) {
+		struct scmi_msg_imx_bbm_button_notify *button_notify;
+
+		ret = ph->xops->xfer_get_init(ph, message_id,
+					      sizeof(*button_notify), 0, &t);
+		if (ret)
+			return ret;
+
+		button_notify = t->tx.buf;
+		button_notify->flags = cpu_to_le32(enable ? 1 : 0);
+	} else {
+		return -EINVAL;
+	}
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+	return ret;
+}
+
+static enum scmi_imx_bbm_protocol_cmd evt_2_cmd[] = {
+	IMX_BBM_RTC_NOTIFY,
+	IMX_BBM_BUTTON_NOTIFY
+};
+
+static int scmi_imx_bbm_set_notify_enabled(const struct scmi_protocol_handle *ph,
+					   u8 evt_id, u32 src_id, bool enable)
+{
+	int ret, cmd_id;
+
+	if (evt_id >= ARRAY_SIZE(evt_2_cmd))
+		return -EINVAL;
+
+	cmd_id = evt_2_cmd[evt_id];
+	ret = scmi_imx_bbm_notify(ph, src_id, cmd_id, enable);
+	if (ret)
+		pr_debug("FAIL_ENABLED - evt[%X] dom[%d] - ret:%d\n",
+			 evt_id, src_id, ret);
+
+	return ret;
+}
+
+static void *scmi_imx_bbm_fill_custom_report(const struct scmi_protocol_handle *ph,
+					     u8 evt_id, ktime_t timestamp,
+					     const void *payld, size_t payld_sz,
+					     void *report, u32 *src_id)
+{
+	const struct scmi_imx_bbm_notify_payld *p = payld;
+	struct scmi_imx_bbm_notif_report *r = report;
+
+	if (sizeof(*p) != payld_sz)
+		return NULL;
+
+	if (evt_id == SCMI_EVENT_IMX_BBM_RTC) {
+		r->is_rtc = true;
+		r->is_button = false;
+		r->timestamp = timestamp;
+		r->rtc_id = le32_get_bits(p->flags, SCMI_IMX_BBM_EVENT_RTC_MASK);
+		r->rtc_evt = le32_get_bits(p->flags, SCMI_IMX_BBM_NOTIFY_RTC_FLAG);
+		dev_dbg(ph->dev, "RTC: %d evt: %x\n", r->rtc_id, r->rtc_evt);
+		*src_id = r->rtc_evt;
+	} else if (evt_id == SCMI_EVENT_IMX_BBM_BUTTON) {
+		r->is_rtc = false;
+		r->is_button = true;
+		r->timestamp = timestamp;
+		dev_dbg(ph->dev, "BBM Button\n");
+		*src_id = 0;
+	} else {
+		WARN_ON_ONCE(1);
+		return NULL;
+	}
+
+	return r;
+}
+
+static const struct scmi_event scmi_imx_bbm_events[] = {
+	{
+		.id = SCMI_EVENT_IMX_BBM_RTC,
+		.max_payld_sz = sizeof(struct scmi_imx_bbm_notify_payld),
+		.max_report_sz = sizeof(struct scmi_imx_bbm_notif_report),
+	},
+	{
+		.id = SCMI_EVENT_IMX_BBM_BUTTON,
+		.max_payld_sz = sizeof(struct scmi_imx_bbm_notify_payld),
+		.max_report_sz = sizeof(struct scmi_imx_bbm_notif_report),
+	},
+};
+
+static const struct scmi_event_ops scmi_imx_bbm_event_ops = {
+	.set_notify_enabled = scmi_imx_bbm_set_notify_enabled,
+	.fill_custom_report = scmi_imx_bbm_fill_custom_report,
+};
+
+static const struct scmi_protocol_events scmi_imx_bbm_protocol_events = {
+	.queue_sz = SCMI_PROTO_QUEUE_SZ,
+	.ops = &scmi_imx_bbm_event_ops,
+	.evts = scmi_imx_bbm_events,
+	.num_events = ARRAY_SIZE(scmi_imx_bbm_events),
+	.num_sources = 1,
+};
+
+static int scmi_imx_bbm_rtc_time_set(const struct scmi_protocol_handle *ph,
+				     u32 rtc_id, u64 sec)
+{
+	struct scmi_imx_bbm_info *pi = ph->get_priv(ph);
+	struct scmi_imx_bbm_set_time *cfg;
+	struct scmi_xfer *t;
+	int ret;
+
+	if (rtc_id >= pi->nr_rtc)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, IMX_BBM_RTC_TIME_SET, sizeof(*cfg), 0, &t);
+	if (ret)
+		return ret;
+
+	cfg = t->tx.buf;
+	cfg->id = cpu_to_le32(rtc_id);
+	cfg->flags = 0;
+	cfg->value_low = cpu_to_le32(lower_32_bits(sec));
+	cfg->value_high = cpu_to_le32(upper_32_bits(sec));
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_bbm_rtc_time_get(const struct scmi_protocol_handle *ph,
+				     u32 rtc_id, u64 *value)
+{
+	struct scmi_imx_bbm_info *pi = ph->get_priv(ph);
+	struct scmi_imx_bbm_get_time *cfg;
+	struct scmi_xfer *t;
+	int ret;
+
+	if (rtc_id >= pi->nr_rtc)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, IMX_BBM_RTC_TIME_GET, sizeof(*cfg),
+				      sizeof(u64), &t);
+	if (ret)
+		return ret;
+
+	cfg = t->tx.buf;
+	cfg->id = cpu_to_le32(rtc_id);
+	cfg->flags = 0;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret)
+		*value = get_unaligned_le64(t->rx.buf);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_bbm_rtc_alarm_set(const struct scmi_protocol_handle *ph,
+				      u32 rtc_id, u64 sec)
+{
+	struct scmi_imx_bbm_info *pi = ph->get_priv(ph);
+	struct scmi_imx_bbm_alarm_time *cfg;
+	struct scmi_xfer *t;
+	int ret;
+
+	if (rtc_id >= pi->nr_rtc)
+		return -EINVAL;
+
+	ret = ph->xops->xfer_get_init(ph, IMX_BBM_RTC_ALARM_SET, sizeof(*cfg), 0, &t);
+	if (ret)
+		return ret;
+
+	cfg = t->tx.buf;
+	cfg->id = cpu_to_le32(rtc_id);
+	cfg->flags = SCMI_IMX_BBM_RTC_ALARM_ENABLE_FLAG;
+	cfg->value_low = cpu_to_le32(lower_32_bits(sec));
+	cfg->value_high = cpu_to_le32(upper_32_bits(sec));
+
+	ret = ph->xops->do_xfer(ph, t);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static int scmi_imx_bbm_button_get(const struct scmi_protocol_handle *ph, u32 *state)
+{
+	struct scmi_xfer *t;
+	int ret;
+
+	ret = ph->xops->xfer_get_init(ph, IMX_BBM_BUTTON_GET, 0, sizeof(u32), &t);
+	if (ret)
+		return ret;
+
+	ret = ph->xops->do_xfer(ph, t);
+	if (!ret)
+		*state = get_unaligned_le32(t->rx.buf);
+
+	ph->xops->xfer_put(ph, t);
+
+	return ret;
+}
+
+static const struct scmi_imx_bbm_proto_ops scmi_imx_bbm_proto_ops = {
+	.rtc_time_get = scmi_imx_bbm_rtc_time_get,
+	.rtc_time_set = scmi_imx_bbm_rtc_time_set,
+	.rtc_alarm_set = scmi_imx_bbm_rtc_alarm_set,
+	.button_get = scmi_imx_bbm_button_get,
+};
+
+static int scmi_imx_bbm_protocol_init(const struct scmi_protocol_handle *ph)
+{
+	u32 version;
+	int ret;
+	struct scmi_imx_bbm_info *binfo;
+
+	ret = ph->xops->version_get(ph, &version);
+	if (ret)
+		return ret;
+
+	dev_info(ph->dev, "NXP SM BBM Version %d.%d\n",
+		 PROTOCOL_REV_MAJOR(version), PROTOCOL_REV_MINOR(version));
+
+	binfo = devm_kzalloc(ph->dev, sizeof(*binfo), GFP_KERNEL);
+	if (!binfo)
+		return -ENOMEM;
+
+	ret = scmi_imx_bbm_attributes_get(ph, binfo);
+	if (ret)
+		return ret;
+
+	return ph->set_priv(ph, binfo, version);
+}
+
+static const struct scmi_protocol scmi_imx_bbm = {
+	.id = SCMI_PROTOCOL_IMX_BBM,
+	.owner = THIS_MODULE,
+	.instance_init = &scmi_imx_bbm_protocol_init,
+	.ops = &scmi_imx_bbm_proto_ops,
+	.events = &scmi_imx_bbm_protocol_events,
+	.supported_version = SCMI_PROTOCOL_SUPPORTED_VERSION,
+	.vendor_id = "NXP",
+	.sub_vendor_id = "IMX",
+};
+module_scmi_protocol(scmi_imx_bbm);
diff --git a/include/linux/scmi_imx_protocol.h b/include/linux/scmi_imx_protocol.h
new file mode 100644
index 000000000000..e59aedaa4aec
--- /dev/null
+++ b/include/linux/scmi_imx_protocol.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * SCMI Message Protocol driver NXP extension header
+ *
+ * Copyright 2024 NXP.
+ */
+
+#ifndef _LINUX_SCMI_NXP_PROTOCOL_H
+#define _LINUX_SCMI_NXP_PROTOCOL_H
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/notifier.h>
+#include <linux/types.h>
+
+enum scmi_nxp_protocol {
+	SCMI_PROTOCOL_IMX_BBM = 0x81,
+};
+
+struct scmi_imx_bbm_proto_ops {
+	int (*rtc_time_set)(const struct scmi_protocol_handle *ph, u32 id,
+			    uint64_t sec);
+	int (*rtc_time_get)(const struct scmi_protocol_handle *ph, u32 id,
+			    u64 *val);
+	int (*rtc_alarm_set)(const struct scmi_protocol_handle *ph, u32 id,
+			     u64 sec);
+	int (*button_get)(const struct scmi_protocol_handle *ph, u32 *state);
+};
+
+enum scmi_nxp_notification_events {
+	SCMI_EVENT_IMX_BBM_RTC = 0x0,
+	SCMI_EVENT_IMX_BBM_BUTTON = 0x1,
+};
+
+struct scmi_imx_bbm_notif_report {
+	bool			is_rtc;
+	bool			is_button;
+	ktime_t			timestamp;
+	unsigned int		rtc_id;
+	unsigned int		rtc_evt;
+};
+#endif

-- 
2.37.1


