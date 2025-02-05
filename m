Return-Path: <linux-rtc+bounces-3092-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C343A28070
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 01:59:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9C05188806A
	for <lists+linux-rtc@lfdr.de>; Wed,  5 Feb 2025 00:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E06A15FDA7;
	Wed,  5 Feb 2025 00:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CMZlDmrh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011047.outbound.protection.outlook.com [52.101.70.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92FA2F43;
	Wed,  5 Feb 2025 00:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738717155; cv=fail; b=Y3zMsziYPRWmciNV0/giKo8IfXJLEW/P7GcUnXkOFKjRuriMZNzbfvlQ6RTaE65Z0uW9dxrpknWMH9lN+MoEZo5bpPjodCfvwo53M57XROUpcxU6xzYcyHJr5K5uvm1W2JsA6HQ+X2itZP34SmBqo7oah5e7UNVl0a1+kZgctgM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738717155; c=relaxed/simple;
	bh=pP+512FswvEkhUvYgW6pJ6UUMbdRWOKWIYksnsa3uUs=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=sM8CF0e0uud2YiflM2PU0rNgXz6LJ4i8TRjCH3urrH2qqw0+bqF4xq+ErDJdFEamvAjIaeTeJRG4ymyJVXvnwlwb7PU0iY+xs9AoO+/KLoGTd3p6IsXU/4SUu67EcBOwCvSB6B2NFljJkFFPXxV9aWQcgAiDZ9NhLbnMi0Jsu2Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CMZlDmrh; arc=fail smtp.client-ip=52.101.70.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MjZLtcH85MxSng69exd0dfsXC17pTEf5MQlO5K3pky7/lmVu0Trv3+SijmJWZlkVvf26wTv0P3s4qk3pcns2p0mFh9FRnwJjyUkuK7W3YtYw3bgfYKms9Cgw1seYiZUXEakCVOIrv6s0EGvFF4LrMyEC+SwG71ix/XJ0wCzcAYrn3FqZnZUSlBGt+v+Z5OG4oXwYHY9Yc/gh5V4dGRAbMljIhUWts7pXthgP5m7n9IuJiJAsXe4W4s5Q6TxqQXCePqbjdEvlecn8/mWC0o7N30PGB+vbynsoWBMemJ7bfkJa+v306TA/8rEwSnegPB/pN01bW6LqnDPfe/O3m70Vfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EeDiUl6IeEIVLemONuYP1oSqQR1pIWcp1WTKF7bD7XE=;
 b=BTfA8TgIgZs1oB1HcEB3RKc6gEqg7iXDJQqcPCPy13/1cL0m0SXSH1eGqs75sos+NbkDk4svwBi9i5nwzFIOcY+f5Z4e6TIj93DdBfAHdqBwRjUxT8/9qRXhvuCm1QIEa40DO1QULULFFc7FXumsdDOmO5CsnGba0MayhOWfVCz0HFpMOhpjQ/OCqhJAzyrPwBQ8UF5LXLUKhTmTLfFZnGHrJVbnGY2la5Xiu9mQtdMi+dC53hiJ7cBFUfydndEQI3dkoG2p1kwsLoSsK6F+SsBGnxLyi8+ANzKTQ95SCYBblFT+3Eh0xGHwyK3DOa4O4y7ej3LLr27pBie/88FBIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EeDiUl6IeEIVLemONuYP1oSqQR1pIWcp1WTKF7bD7XE=;
 b=CMZlDmrhoifm/ZDqAdbeAgWmtbZOvnfGt6AKK0MZcSSR/TDb6ZOX+94gSgA6cMUcuSJu0GKfoqzooIei4f3ymzGp3q8sLm62pmdLeeYcdkDWMe8Zv+fg2Gz/LCCk4WTgStXa7EEzDivMvJISd4Z2lJDxbAKLSld40+MONGS+imuyWWswrI75CGbXJQzZXjUBV7IGaUqBXIjfhHgHqRxFiwfZehoQGyvjX4+k0+fz1/XntAxxFzjXQoKlycDDnWx+zlZYoH2WS3m0d5nWjoRkrpCmb1HbP7EOiyqnh7hiF83QcYOAQQBve8bOvhCLr2PQ++jYQMdWqlRh2cquCxUJ1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI2PR04MB10713.eurprd04.prod.outlook.com (2603:10a6:800:275::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.26; Wed, 5 Feb
 2025 00:59:10 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Wed, 5 Feb 2025
 00:59:09 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/7] rtc: Use devm_pm_set_wake_irq to simplify code
Date: Wed, 05 Feb 2025 08:58:18 +0800
Message-Id: <20250205-rtc-cleanup-v1-0-66165678e089@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKq3omcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNT3aKSZN3knNTEvNIC3RTjFBOj5NQk4xQjCyWgjoKi1LTMCrBp0bG
 1tQAfhjmRXQAAAA==
X-Change-ID: 20250205-rtc-cleanup-d3d42ceb3d28
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Peng Fan <peng.fan@nxp.com>, Antonio Borneo <antonio.borneo@foss.st.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738717111; l=1285;
 i=peng.fan@nxp.com; s=20230812; h=from:subject:message-id;
 bh=pP+512FswvEkhUvYgW6pJ6UUMbdRWOKWIYksnsa3uUs=;
 b=+W7fD9ICdwZ5wZUvU82MMMvZi6KEtqNkni2NT6mG9YQFa4tO4wzeqCDfXbSZzfq880kJIl8iy
 UWx0f5MvPDTDHpOTkxHHIuQVUeBKLQzJtg3r1EhgBkqLLqExdIoj85A
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
X-MS-Office365-Filtering-Correlation-Id: bfe177b3-3703-403f-3e97-08dd45804c36
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c2N0SERVcHNZaGV2Nm5oOUp5eXpsZEJreW9tbUJ6UHdQWTlabmhUdUg5dlpB?=
 =?utf-8?B?cGpKVFhkSVhYNTVwUGY1ZjF3Um8rNzZNWGhYbU8vaXpZYXRCOThuMERDVjVl?=
 =?utf-8?B?OGFZZW9lbWsyM0g5dk4zeXpiTWRZZWRONCt3RkNqMkxBRVZSdHFqN0YwdFJo?=
 =?utf-8?B?REdwd1FHWTBhNDQyZkg4L20zQkZ4K0dwaTY1RmdLcjVVNjM0WGtNZGVXd3VQ?=
 =?utf-8?B?VTFQSkpjWHJ6MmV5SjZIenZ3Q1lxUzd6bEQ3aWcwdnZOZ1M4YzA2SEtmQk9F?=
 =?utf-8?B?dm9RVTlocm9GMUdCbG1CYUVUcFBPNFUyWHp2NGh5b3dVZFUwTUFJbk9uNXFj?=
 =?utf-8?B?M3E5MzBsM3Z1emlNa1ZWT2dmWmFteDJlTEZMY1UrTzVRYWUzL1F5czdwTk5Z?=
 =?utf-8?B?c3Z2U0RsMTVUU3VyMTRtZzg3Qk9zZSsyaC9leXA2TW42dGZTOVE4aVp1Wnlt?=
 =?utf-8?B?R2hDdHdEcDYwbDVJV3ZwVEJ4RTZjdVVITXVGYVhjcmE3T2VGbHhQZTUyK0RZ?=
 =?utf-8?B?L1gyUDRLM29saStHWmpjOWZLSTFOTUtqYjZubU5MU3ZGYW5wZnZWV1R6UTBI?=
 =?utf-8?B?QTlZcjhSeFN0TFRxUDFuWXRCQVpPYVJxRXhvNFpYR0pvU2JpQTdWS1dRY0hN?=
 =?utf-8?B?M3NERllEYll4TlhIb1paY1NxeHVYTnYyaW1ZS3NTK1UwbVJUMzZzOWxMUmNT?=
 =?utf-8?B?aVdYWWhWVnhTUWJxNm53T29GVjJIb0VLUENQaWpxLzc1d3g2Zy9sejlhRVZS?=
 =?utf-8?B?bkpYQmJiTE9KWUJZODM5eUc5SFREZlBidm1RVlBIMEdsbmQxSFIxWWRnbHpU?=
 =?utf-8?B?cS8vSTZFRWF1S2p4ZEpDaElRU1NEaGRmOGJ2bTZSN0ZJT3pxVTJFRW9Lc2NN?=
 =?utf-8?B?U1hSSG51VzAvVXQrRHI5RENlVXNvcFd0RmRnT2dwbHhHQ1A3S2l1aVJNS2Rr?=
 =?utf-8?B?MmRhdnV2RU16V2Q1eGk4N1ZNWERSdEpvVFhrZHVXU3VhK1VDMHhDOFl6OWQz?=
 =?utf-8?B?Uysxbzd4S0FuWUcyZy8rWEtFM2J1WUpYYk1RL1ErU0dUY1NuSE0vSTh6UHpO?=
 =?utf-8?B?WGFGcFQzZEs4ZVBaeTF2TmZ2eUwwOXlENjRqc0JaUzVVWU1pVm5zU2tqL29o?=
 =?utf-8?B?a3l0MlBDZy9tVFVoRTJ4di9nUjJQWUJTNjEyM1IyTWx1cWdWVUF0Um9DNXc4?=
 =?utf-8?B?VzJ6ODlXemNCc0s5V3l6R2NKUTJwZDZCZHJVdmd0UEI3eXpHcUw2ZVptOXVJ?=
 =?utf-8?B?dmpjSThPM1FpOG9pM0JCZDBlSGpNM09zNVg2SzV4TkVDVzBGeWxvL1YwRUkv?=
 =?utf-8?B?WlcwRTBWeTR1TGRBWUU1aklyU2VaWEZSOVJGSk1wVDJpb25nL1BkY1d0SXBK?=
 =?utf-8?B?NHlMbTVITDN1dVdNRHZqRjRkWWdwN1RrblZCa2M1dmwvMHhRUWt4VjFrRkhP?=
 =?utf-8?B?RXMzZTNaVTF0VDNwUXJFYmlIUHI5VVp1bXZ4cHd6WGpOT3dlblJBL0pNcjhj?=
 =?utf-8?B?UllGTmtGZWg1MTRZUE9SWHYxZFQ3ejlFWnpQL3R0V1IxWjNYdlJPc2NsTVh3?=
 =?utf-8?B?MjN2Yy9STmhCeHdRNm9HdTMxTWhMR09HRUJSTkNUT3R3R2dGVXRobVZESlZ4?=
 =?utf-8?B?M1IxWm1KUnlCMjJMekYzaVNmTmZZNUlpVWlOZ1Z3Ui9ESTlTcUlnQURpLzdU?=
 =?utf-8?B?OTFrRHJDYkZLQmJienBqZ1p0T0xxaHZYNkV1NU1rM29kRGlSWmV3SUhTMTEv?=
 =?utf-8?B?dUkwUG5wdC9JWlI5bXVwV1FIQmFuSHBoVkNFZVppSjVIZFZ6VUVHWWpwTTRK?=
 =?utf-8?B?bGNkVFhLYVFNWXR2SHhHbzBESlZuV3dCbm9GMGloNWdDTzlHM1V4V2xWdXI3?=
 =?utf-8?B?SVMxQ3hEbTljSkFabHg4a29VdEk4TGpLbGMxQy9hWG5ST3c9PQ==?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUhnRTd1eFFiRWZSc2dUT3YzcWVkVWRDQVhLanQ1bjlQQkF3RklXZ0dzSUdO?=
 =?utf-8?B?b3JzRGg3WWZjWnhoR0VmS3hFaGRMSS9WZVBGbHVDNVRnaTdlLytjbUxrZVox?=
 =?utf-8?B?VUFWay91dDU2ZXpDYlR3Ynl4TGl0dnAxcUFuZXcvZVRCNTRWS1NPMENOdDly?=
 =?utf-8?B?OTg4OHdKUlJGdDljN3k1b00vbGZiZGFTUm5xRzhYMGc4eDJnOU1waENDN2Nu?=
 =?utf-8?B?MFlEUmFoVVkxMXkzUUVDSjJOQ0RaMlFvSno3VDlwRU5VeGR2MTdqRmlKWXY0?=
 =?utf-8?B?eHRNSHE1T0ZXT1AzZzI4aWc1Mzlhbm9HMTQyMUVyd2lMUFQwVWF5ZVp3dm1Z?=
 =?utf-8?B?aDRwUkZnOERrelVYa2p6ellJRU1XMjJzczJPT050cW9NYlVKaTRsb25QSEpR?=
 =?utf-8?B?b3hRcktpa3RxVDViQ1pqRVZQT2U4N3AyTGEwc0JhbHFPUnZFenR1SmhYaVlp?=
 =?utf-8?B?SlN3Z0N3SXRjL0MxdjBQY3VhR0ZXblNmN1prVU8rc1RXaFV0YXFaS0lXR3NM?=
 =?utf-8?B?dUVtTWpvWUhtQjRYRitDSGJBRm01VXZKM0VaOEZudkJmNWpGTmxzRXgzUDFQ?=
 =?utf-8?B?TTM4V205L1lVQVRmb1RCTXJzTmZvNjliUktnMllJRml1d0ZxUU5pU2JSUFp3?=
 =?utf-8?B?a3pNN3hhZ1BHYkNmZXdaL0dtWFNHM09Zb1ZSYXgzajJmb09TOVJsV24zSGR1?=
 =?utf-8?B?Qmp0TFhWNG1pVzFhTENlKzVSVDd0V2d2cWRRVmJlYStIcjZNT3FhRFYvZ3Jr?=
 =?utf-8?B?ZFp3LytuK2lKTFBCOXQwNDhQM21YT2dac0RiTVF5QllzMDFmRzN4S1NqY2ZL?=
 =?utf-8?B?QllvNXh5VFUrQVFjZUltbXB6VnIzVlFDNWIvTnBYa1BuVko1L1NvZ0dsVXpz?=
 =?utf-8?B?ZTNJbkJNL1BITmxicXNJdGlIUURLdFR6YjVLalBJM3dsVitwMGdlNDg2c0Yw?=
 =?utf-8?B?TnBxVXpBT1dtV3FNL3Y5TVRzWlZYNExRVnphcE45U2RCbU9DOVIvbDRKRXJU?=
 =?utf-8?B?cEhocXVSazdqM1hoS2NCSEdjRW8zVEFPWlBaOUMwdURNcFdTOHdVVk5wSFlq?=
 =?utf-8?B?R2FMMHRySEFLdGJsazhabTZuNWR3aTJzandCUlZlR2VTSGE1K3ZDTXpBNkRz?=
 =?utf-8?B?ODNhQUJIVFZEaWNXTnF4RXY1MHFoa2xNb2xtdnUwTGl2UURjR3N6MHdybVVw?=
 =?utf-8?B?YTAxaU5PQU0rWWZYWkhsZXkwS0xFaXp4NEx5SmtFZzZKM2E5ajhzY3hrb1lC?=
 =?utf-8?B?d3lNWjRmL05UOU1MaU1COUk1TzN4NXBIMzJ1T2VXQlVsRk4ycWJXcTR2ajU4?=
 =?utf-8?B?Uk5nOXh3SGJDdlRhSXFnU3F4NmNFb1R0dmlDWEtTV1E0OFJPS2Qya3d5NEVF?=
 =?utf-8?B?YXhmOFNKU3NvUncwMEZOWGNGSVRxN2lESks5eFBab3NtaGNMRUgwclZDVkVG?=
 =?utf-8?B?WGVQUVVWaDEreVAzb0JkT1RKeGVQZGpSMis2VVBpWmJYMVV2NU81VW1vSVM2?=
 =?utf-8?B?QUJiNzdodk9MZzVyL0cwWXo5MjVjRXNDM3AwZG5LK0ErZTVrQ3A0cU95VkhD?=
 =?utf-8?B?RmJBWHNDSHI0YUxLbVp2eEl1RzEzMFNSdUNZOE0rL2ZmUnhRaWh2bGVFTFBz?=
 =?utf-8?B?cndFb05Mb2N0SjhpSEpDYU9DR2JsUHpHbHhVODgvTHBTdmlsZzNoRVZldXhF?=
 =?utf-8?B?K2JZZEk1S1VoTUVRendtTWF1NjRaMjdTbUREc3hjSXhPc3hld2F5OHN5dmdj?=
 =?utf-8?B?QUVsNEE2NFQ2VFI4bHJ1cGFySE9kYUxNMWFxWitlaDhSdzk4bDNKTnRLQU04?=
 =?utf-8?B?UWVtTmtRSXNGVGszWm5xZ2gvWTFrZVF0a2x1SzRLNTBEM0xWZUxTMERjWGNG?=
 =?utf-8?B?RUpUTy9GU1dmaVNNSDhrZEsvdTA4Z1RNRDBVdklLR0FsOGdIY0lTZE5BeG9h?=
 =?utf-8?B?N1lXc1hoWXZhNjZRK3BScm1xb1BnWk9wYlJBRnVaUGp5cUJSRS9Ubzhic2M2?=
 =?utf-8?B?UE50cnhsaERsOC9QV3lTa250dHQvU0JPb3hqNkRkRUxtajZ3QTN6MzQ2WEVB?=
 =?utf-8?B?dWZvNWdhUU5FM3l6SHlDVURnYTlBdFl6SlhHejFXVFdKeDl2eDRiYVd1ckFp?=
 =?utf-8?Q?FYDQ/rIAdjYp5xScnHJ7YC3U8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfe177b3-3703-403f-3e97-08dd45804c36
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2025 00:59:09.5409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztluzq+0mSGtA4BT4cZRRKI6QhFS0r8uz2Ik368vRc1nf8+3yDWrWDLO9QqmLiIk6+AyawpFywxiySEFKmCPOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10713

This is a pick-up of patch 6-12 from patchset [1]

Since devm_pm_set_wake_irq is in 6.14, so resend the rtc parts.

R-b tags from Linus Walleij and Antonio Borneo are still kept.

[1] https://lore.kernel.org/all/CAJZ5v0jb=0c5m=FeA-W-aG30H4706Ay_xCHTsiC1S-7MuGxqTQ@mail.gmail.com/#r

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (7):
      rtc: stm32: Use resource managed API to simplify code
      rtc: nxp-bbnsm: Use resource managed API to simplify code
      rtc: ds1343: Use devm_pm_set_wake_irq
      rtc: pm8xxx: Use devm_pm_set_wake_irq
      rtc: ab8500: Use resource managed API to simplify code
      rtc: mpfs: Use devm_pm_set_wake_irq
      rtc: pl031: Use resource managed API to simplify code

 drivers/rtc/rtc-ab8500.c    | 11 ++---------
 drivers/rtc/rtc-ds1343.c    |  8 +-------
 drivers/rtc/rtc-mpfs.c      |  8 +-------
 drivers/rtc/rtc-nxp-bbnsm.c | 29 +++++++++--------------------
 drivers/rtc/rtc-pl031.c     |  6 ++----
 drivers/rtc/rtc-pm8xxx.c    | 12 +-----------
 drivers/rtc/rtc-stm32.c     | 10 ++--------
 7 files changed, 18 insertions(+), 66 deletions(-)
---
base-commit: 40b8e93e17bff4a4e0cc129e04f9fdf5daa5397e
change-id: 20250205-rtc-cleanup-d3d42ceb3d28

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>


