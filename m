Return-Path: <linux-rtc+bounces-3099-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66142A2808A
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 02:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 24D2A1888DE8
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 01:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A626229B29;
	Wed,  5 Feb 2025 00:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="xehDLvqm"
X-Original-To: linux-rtc@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013050.outbound.protection.outlook.com [40.107.162.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C83228385;
	Wed,  5 Feb 2025 00:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738717182; cv=fail; b=O0myGGLfvVM+SBjZ82Bi9MbDzNqL8eYnBdsa2lel9FTK9cFlOoRzfbfFkaHKucYW9MfPNDusl6c/yaLgl5iGjXvSnVI+bVEKGDC8CiwRMGg7Lths+5eWUL6mrB2z4f5sdTqQ9HHhI2Sa763N+w2Pmn7vHS6Zn9QpLFIwj3RF2V4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738717182; c=relaxed/simple;
	bh=AcWk+DTl4vJlEoX1Fz1L2UUCItL1uFcWaPK5Bz+U1lU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=kv2FOJjOlXEqJT4KNPxkZtIx/D9PXL+lan8H/riTgSV2SCA/zeEoBO7YilMY3VV9UWMJFAa/7wB/OlKXWjJoQNPbzEQjJ/GG6wnsUb8P31c4AEY6vk4e/x/k5ci1JFKGUPATNLnCKuX/vdlcrQMs3FDzjAxZm0/yb+Za6Q56yFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=xehDLvqm; arc=fail smtp.client-ip=40.107.162.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NKAoflszZ7mlKl9PYHCgJY6OEDFp91cFt7//ipvC6nMo0K5WrAhVVg1db7OAjcqkHXHOjKSUGvxasdBoVi222Ff2tCoFnGZHR5LMeX+l1krQsXEfcwulh4v4sLlE2lA9wmchZdwZHHz/XkYADOILAdx5REpdtj5Nd9J5/oegjpChv8hZ7aXep8mileT31UmoovwSEGyqlCM3OA7++OQRpZ9YfplaaS7ioZp7WHImZAa+qS4nQ4rUpYLhRLikVivSkuuygs6dTEteacL8DTD2h2/0vSa3NZzWPyFQIP3TB9lUf3V54EcjikTIdknrKuvCJDZKPmR0I8S1IfVZgZROAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwjZqLy9UAzAbl6jmLkoboiwEpYZWe0ARcy3BM/gy6g=;
 b=Iu7LzleXyPFTpA9pxajroIpa81mSuuKH6SWK35k61tWXeuB06gTi7EMZnmwTmMwRf3JNIN958e9nkmKE6125GmRPoCIscg+Utttte2KR1qpNTQqK1u/Bmn4nFFG8pmmkrFlO8By2BTQS9PJwqGYD6NC2zm7ut5XRACSX4zFx0dA1wqNZDNHF2ZP5BYWlW9GsqQB0/c10rQmzmfh2SE+EYTRaTVY8T9VSbpy0WhxYn7StF32LvREuai7yuPaCAaQWFm8mwzoGVxLBIrKEOnYignuk+kUB9JJ7CYMcT9JbHw3J6/JAK1gFyf6p/KX5UH7uQw7wHP5fKAyCsqqulRLKEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EwjZqLy9UAzAbl6jmLkoboiwEpYZWe0ARcy3BM/gy6g=;
 b=xehDLvqmOSYIWp59xODlz9s8xncr3v2CW4nz7PWrlcpSP0DgWSRC+d3PlXFADPlpLy7/v95oK4HJyVJcWE6gVcnAtICeYHhi6085fnpzX8E8g6gBDes9eV8F5wXDArdKR9TZsXkdIj4oyHu++ij20MbzOLRg4Dgp7aIgoUPBpJn4L4o9MVwrpTzxvwU9DYA+89DGSz+8YkhPeiLyZ2HSBb42ZNWFUYu38pdPN5sSdQHGV4lrbxG5pSYPUF83tEPWEuiHyU+K/qyn2g/4ayHojdEVXf3q2AZYaxBwRs3frS1WAvzr7UaoADYFisDxXrAcyzFhxsvYRDnMcIsPPyoe/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10713.eurprd04.prod.outlook.com (2603:10a6:800:275::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 00:59:37 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 00:59:37 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 05 Feb 2025 08:58:25 +0800
Subject: [PATCH 7/7] rtc: pl031: Use resource managed API to simplify code
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-rtc-cleanup-v1-7-66165678e089@nxp.com>
References: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
In-Reply-To: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738717111; l=1457;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=836X+TA/l2wfm7yon8oTf/+NEC4So+0tkKKh8ZKoqD0=;
 b=8b+RiW38bzcj7vW9C3nT/sXnco85VHDgcMhjl+0oTU3U8lRGFu1FS0OqHTfe7FEm8pMc6TD6S
 CcnR0JtCPB9Bg8e17MVnczKMvC1sDBxLvXZuA57wbWLOBQLeV5v1DtW
X-Developer-Key: i=peng.fan@nxp.com; a=ed25519;
 pk=I4sJg7atIT1g63H7bb5lDRGR2gJW14RKDD0wFL8TT1g=
X-ClientProxiedBy: SI2P153CA0034.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::17) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI2PR04MB10713:EE_
X-MS-Office365-Filtering-Correlation-Id: 793ddd20-9a38-46cc-7474-08dd45805c9e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dzkrWVRicW40SXlVOVZsM0Ixb1BMRkdNQnl1NEF1eWNteXJYWk9IeU15bkFG?=
 =?utf-8?B?WjNkMUlGbThMUVZXeEZGdEhzVzdlZ3JhaldvUXhjUWM1NHpzU0tETlk4M1dr?=
 =?utf-8?B?RWZ3K1cwNlF1eXlYV0RIamZCbnRDUFZ2K25reGtXQ095Rkw5RTEwTmxaRGYz?=
 =?utf-8?B?bGFUSmJ0Vlhzb2Z4U2JBcHZ2ajdRVkE0K0FSQzYzaWRlUHdiTkNuL3loakJU?=
 =?utf-8?B?V0pnUjdzV2VkdmdTZjJhN2hJK3ZjZ0ZIR1dtaWN5eFNWYmRGSGl1QnhVa2th?=
 =?utf-8?B?WXZ4NE1aakVNUFIvY2lremRsSHpHclFGMGNIU3ZORnpUekZBa2tiZ2ZzSDhD?=
 =?utf-8?B?bytLZVRqcUNCcXhpTzMyNUJMOURjL1NwdmdiMENUUE1qdWJwbUhJdGlZVEFr?=
 =?utf-8?B?dCsyRUN6cmljN2V3LzE3amVqZWhZYWpFTU9zb05GaTBNbGN3azk0SDlVbXRB?=
 =?utf-8?B?YU5LOXJyeEFkNzJxZkpJQXByNk1hbFVlaE9XSHpyRlZlOVRBOS9rR1JWcTNs?=
 =?utf-8?B?b3prc2Vxa0gzVFNreExOa0tFeENsZ005T1lPQ3NYcjZ6a0hyVjkwVDI4VkxC?=
 =?utf-8?B?R1I1YjBjTGxBR2pnL05kUitxcGNLNU1JRFh6QmoxT2x5cnVuczByWjk1Ui9U?=
 =?utf-8?B?V1hhUWR2TVppSFpQTHZCN0xxL0ZLN2lDTzV4NnZwUHlzRHFIN0VOOHhocjFK?=
 =?utf-8?B?cjNGcGJiR2ZmY2l5Q0ZHL0N1eHJ0bURsNDNwQk9iN2RSVW9oYUx4SHNhbkpE?=
 =?utf-8?B?MW5BSlRSMC8vN0daWnJPbHNmQVJuWml6ODAxTUxFTXBuQ3VjL1ZoUkxGNTVJ?=
 =?utf-8?B?a1JRYWNabFFSb2NGVnV5enFkKzdHZ2JVdnN6TUpMSWJmTnY3UEdGemNqRytn?=
 =?utf-8?B?M0k1KzNtSUQ2cmJRbTNWNVFDTEU4anhVaTRjdmMxQnRtTlZteHhuaW1wazJm?=
 =?utf-8?B?WEZMN2RZeUlRY2NXcitnVmo2c3VlendNVFJxNVpwM1Z5eG9NMDMvU0p4S1JR?=
 =?utf-8?B?aFIzNjFrMXlma1VsckhidndjclRnV0ZNWnJzdno5VkE5azczQysvcFlRZ2wv?=
 =?utf-8?B?b0QvZnF5dDZuU0dvemtha3d1Y3NPNE83b1l6NUpXVVNsTXcycTRJV21HYkhs?=
 =?utf-8?B?VGZZY0lDWHdsdGt6cTFDenAvNEZoaThUZWtGeTJxRGRHOGxqUndJL0JreEFG?=
 =?utf-8?B?ZEJRbDdCRlNJY0U0d1lCeTM2eXd0WTA2R29yTVRqYmJzMitEVWVXVklDeUNR?=
 =?utf-8?B?ZS9tZW11bi9zNGtDdWZPUmtZZ2FIeE5TRUVkbGJzcG5naFdBUmdzb2oycUsr?=
 =?utf-8?B?MVIvYmNLS1dWb3JNWCtkRmtHUW43ZFM2ZkVkcHZVa3oyQXliNGpLSUNNSC93?=
 =?utf-8?B?Q0FDSUNYbWNSbGhUWmZNSVFCY1VmSkRHLzRpYlluRzBKMFlqazNFVHNETGpa?=
 =?utf-8?B?WWpRT2g4YlEySkE1T2FDdC91aGs3VDUwRWcxbWcxQWtENWk5YmcyaWVvMVZL?=
 =?utf-8?B?eXAyU0tlM0Z3YjFPZ2xqdThzdS9FUzRnbGlsbDI4eUdBRkltdHE2c1N3Vko3?=
 =?utf-8?B?WkcrdDBlUkVRbkxZTXp3U2hnVm5CM2VNSGlDUnhhY2ZUZm80K1ZuM0RMVXlp?=
 =?utf-8?B?dTBkcDBFalh1YUlIS3RaYkc0VW9RWUUySUMwRFJsQVExMXpTU0M4RFFSQkFn?=
 =?utf-8?B?Y0MrR0hUdHA5SVc4YXd5dmJWbjI5SXdsamhvUlh6TTI0NEJsZ21hWlJKa2kv?=
 =?utf-8?B?YmUwUWRzb1gzSHVtYlpkYVZRcDRTaFRsVDhZV0RzYll3QnMwWHZjMmJjeC8x?=
 =?utf-8?B?KzQ3dTRXdnNZVzFVMTRqRWFsRVJjbXdidlREcThQa2hPTUxKTit5akZtc0Y5?=
 =?utf-8?B?dG53bFljUVByZGhFL0NYcFBQbHlDd0FEbmhJSlJHNW95SlE4RUlRUHhTOXU0?=
 =?utf-8?Q?AcjFsetIYdDDRfFzMgMVx2n6Y3cIW5bC?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXJIODE3cjYvM0NRV1lGTWRac0NpS0dOUG9idGh1N3l3U3RKYmF6cEFBWU1Q?=
 =?utf-8?B?cTVSOTFwdUJ3L0pYcU1QSjBBYmFnVVZqMmdhd0tCeVhrZWNVVkYrTmtmRGlm?=
 =?utf-8?B?YmlUQTU2amJKRGNSeG81YlpWNDlXTmk3MlV1TGU0eEVaOUVEVmgzUzY1V0lh?=
 =?utf-8?B?bUpXWC92c1g1UUsvQ3NGT2hJT3MrZWR3MlpmT1djKzM5RGVMa2JOYlphWVgy?=
 =?utf-8?B?dEJpdjZ0VUVzdjZVSUtRaUVWTytjbVM5dUx1Ymc1NmR5a0JVMnNUOTRtQ2Iw?=
 =?utf-8?B?QUFobTdRdVZnMnhYeEVRbk1wdVZqaTRTdUZOVXhPZy92QjFaZVJrSzQ2aEZo?=
 =?utf-8?B?SEJ3VWw1MTUyMDYrTCtQTURURjhjdGREUlljSzQrSTFXRmdva3RDSHl4NG9v?=
 =?utf-8?B?VkxhdTZaOXB1Unl0VnpiVm51OGpmckkyKzkwNWZZS3Z4dHlGRDkzcllqa1Mv?=
 =?utf-8?B?ZEhhU3hRTmhJTTZodlRkMFRIRVRyUTdHQ21BN1IwQVZkbFVXc2NKM0NTMm5i?=
 =?utf-8?B?Q0FqRm9ja0FVaWFkcURkWDlrMUFPbWQxMEhleUphdVdxVCt6ajVDMVFFbmdC?=
 =?utf-8?B?UFZLV0paSTl6UnhFLzRDcENtQUk1NHJMN3krN1BubU1la01tSGJFTmVyU0Z5?=
 =?utf-8?B?UjJiZEFPbzVmQndvL1pXUWZRY3NzK2VDTFQ1cnZ2a1R4M25pK3grOFJqaXRr?=
 =?utf-8?B?WEZvdUw3RFFmdTVCSWFoOGoweVZERFdWRUJKRG1BRlh1VjZ4VkVERjB4OVl5?=
 =?utf-8?B?Y3BkRkNHMnl6WmJRU0JKZFpJM0gweTdHajlnY2w1d2RheFhLR2VJYzErNHda?=
 =?utf-8?B?NUo4Yk1TMnlpQ3hNQU81Vy9TOFdGQnhvTEpHcWZ6YUlkMW1NRFdLMkhDMjYr?=
 =?utf-8?B?bkFhdXp0SGtVRWl6QkFZZjFEQmUwRVN2Rm4vYjBhNWdhVFhkSHRRWXcwUzhE?=
 =?utf-8?B?cWZRNFRBMmNXYk5kODVjcDE1U29Mb3lWTlhpbW9ub3lhKzlabHBsWVRSb056?=
 =?utf-8?B?aStOZWd4ek90SEhjWEExQlAxNTVqdmhjRFhLRm5Nc21aL21VaVdZdjBIc2Jx?=
 =?utf-8?B?NVVjWWpFdHY1aERBRXNoL0NNWWhXMDhKY3NFMUZYaVJqc2VaODRmN3JPNE5V?=
 =?utf-8?B?NkM3S0R1Um5za2xmc3VRcmlEcjl5YzNWRVI3NFNtRGEvMk9wYzZQZHF5NUNw?=
 =?utf-8?B?Q09NNTM5UENYNFJ1Mjd5ektBQ2xacmpZNFk1MGlYTmRPSEo3VHVzOGpXMitu?=
 =?utf-8?B?dWtvSVEvYVlnTHFMeDVIZ2NMdnpNNjdmeXV5cjlDeml3SDZWS3hzSGtGWXB4?=
 =?utf-8?B?YnFhTDJpWTcrZnZQS2NFdm1KZ2gyMm1MeCszTElSdTYybW1VME9hQmtmeW1F?=
 =?utf-8?B?V2RialJTQWoyQVk1dCthbFJ6Wk1kMFp3S0I2RnZQeERkcTgySFVDSnE1ZGt0?=
 =?utf-8?B?M2hqNmlyRGZucUJIY1RrYnlwY3RQNXorcVp0SUtNSXRvV3l2QWtodm5tU2hz?=
 =?utf-8?B?bm9QaDJQK25ibElQUWNuQ1h2YU5Bd2Z2aGJrb0RJanZwRncwOUR5emoyVVd4?=
 =?utf-8?B?a0M0aDE2UlRYVUNYUy9JeHZYSHJaaEEwSHpnM1FTYUZDa2ZEYlptYjlMZnRC?=
 =?utf-8?B?YTVQTXh0UXJlSGFmRzRUMW1BZXFoeFkveEh3bjhVZUcwTmMyOWF5VlRCRFdH?=
 =?utf-8?B?cVRxemM0NW0vRGRIdXhHdDlJWUtvbitIVUtDNVoyOUNsSUg0UDVpMTlaUHZj?=
 =?utf-8?B?SWswT0pQVGZ6emVtcWhHV3FNb1ExVEN6YjVlaTRvRkVxK1R5ci9HRGZudUh2?=
 =?utf-8?B?UnNkVVZwY0tHVElSYm5mMDVJM2U4UENidzJIeitaRFQ5d0NEMGttdzUwdTF0?=
 =?utf-8?B?Q081bUJNbmpuSUVOOWlucUFzUnNsRGNXSGp0bTlNOUt6MU9FWHdUTnRWMHhF?=
 =?utf-8?B?Z2I3VlVNVkFOUmlNZVZDNHpxWFlXai9uZWJLMjhpUXUxV0F2Z1h6R2tKWDVx?=
 =?utf-8?B?TU9NTm9VZno0RXhXb0lsbjBEblMxZGpjNlkrMjRLQUJ3dXI3a3BzRmo5Ui9I?=
 =?utf-8?B?VjZUU0FKcUNsakUvUDJYbFliSGRHcFRnRjlVa1phaDdTbE5tVmd4UU0wN21m?=
 =?utf-8?Q?3e1JLy8xLZ/s2j1BI55eJsv7l?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 793ddd20-9a38-46cc-7474-08dd45805c9e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:59:36.9576
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2oPoxj+HRZgTo9C3XvebIy33LXIv+qsbQEPWs3oi2EnamYs+w73SWn3eqvWRDfveyM3wqXzBRRv4+6LlAn/9EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10713

From: Peng Fan <peng.fan@nxp.com>

Use devm_pm_set_wake_irq and devm_device_init_wakeup to cleanup the
error handling code and 'driver.remove()' hook.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/rtc/rtc-pl031.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
index bad6a5d9c6839ca70905e3d46286b9729c1fd435..47bfc5395e5908b7722b98276399120f1ba65af0 100644
--- a/drivers/rtc/rtc-pl031.c
+++ b/drivers/rtc/rtc-pl031.c
@@ -284,8 +284,6 @@ static void pl031_remove(struct amba_device *adev)
 {
 	struct pl031_local *ldata = dev_get_drvdata(&adev->dev);
 
-	dev_pm_clear_wake_irq(&adev->dev);
-	device_init_wakeup(&adev->dev, false);
 	if (adev->irq[0])
 		free_irq(adev->irq[0], ldata);
 	amba_release_regions(adev);
@@ -350,7 +348,7 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
 		}
 	}
 
-	device_init_wakeup(&adev->dev, true);
+	devm_device_init_wakeup(&adev->dev);
 	ldata->rtc = devm_rtc_allocate_device(&adev->dev);
 	if (IS_ERR(ldata->rtc)) {
 		ret = PTR_ERR(ldata->rtc);
@@ -373,7 +371,7 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
 				  vendor->irqflags, "rtc-pl031", ldata);
 		if (ret)
 			goto out;
-		dev_pm_set_wake_irq(&adev->dev, adev->irq[0]);
+		devm_pm_set_wake_irq(&adev->dev, adev->irq[0]);
 	}
 	return 0;
 

-- 
2.37.1


