Return-Path: <linux-rtc+bounces-4763-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF96B34965
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Aug 2025 19:54:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DD2352A5E34
	for <lists+linux-rtc@lfdr.de>; Mon, 25 Aug 2025 17:54:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23DE93074AD;
	Mon, 25 Aug 2025 17:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="pT/PWCHi";
	dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b="pT/PWCHi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11020100.outbound.protection.outlook.com [52.101.69.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA42A306D3F;
	Mon, 25 Aug 2025 17:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.100
ARC-Seal:i=4; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756144475; cv=fail; b=ZDsLMr3rZ8ORwea3HA3REhMRFGI/yCKhUtodHr9Md5BghQ09aYj5PcXZZk6Sixej4C4Bnsk06xNGQkW19rzLIyr6UtsXuBuuiEJwl1U1UK/9+n3uwAwp623dpw7PgT3b82/MKkVvQfBGncHXiZjwDFInbYAOmszck2gOMDaAKDs=
ARC-Message-Signature:i=4; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756144475; c=relaxed/simple;
	bh=faBKK/nDRFKnTIarxI2yfulUPEijinPCnCOBJpYhzkg=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=JR9bm+epnZk6yShawuZOuwQf/Md408HP0P0htzy/cQSTTkPyE9TSq83gTC4S0Ydv37WoL6KwGNKuzAUVuTTyIL/CXeem3YuyqD2MDKQltpfpiUrLdf4cQ5WH2ktR9SCqz7wKs4v/IW1Ma5dPD5Rj6c5z8dhD0YeXoqrpyObEb9g=
ARC-Authentication-Results:i=4; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com; spf=pass smtp.mailfrom=solid-run.com; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=pT/PWCHi; dkim=pass (1024-bit key) header.d=solidrn.onmicrosoft.com header.i=@solidrn.onmicrosoft.com header.b=pT/PWCHi; arc=fail smtp.client-ip=52.101.69.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=solid-run.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=solid-run.com
ARC-Seal: i=3; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=qi8B7Rneh2CXaAv8jEkAbPCjKLSOE6ALHFv68mvAUZyt9K5xpwaOOQ2nRqbVCgiRl0jjiKpcLZgAAwwqdYvDNxPXhPGlWdpV713eExL8f9beXueUjt09TgVY1DAb+ptVRBDU8/9qPdKZhVbECkZTYpinFRu7qQxUN0xmW9LERDhkqO3Fy3X/++f2oCoYaZU//ZpS1S+fGmUNMLJPxwPM2981BSre2Ixx50n1Vo8K4LOtGEi7mbSqd/aEf/N+uiJJvM6kCzuAQXL3K+mxk2nWEbFFk+4FEbCY6H+zuXYuCokcXXwvT7PhOyzkdOAlZgZW1pbgEF+f5Kh8cLY4mJ7HEA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCZ5hBC4vS4isaE3e8lk1/JCLbqblxBQlEEAmWJTC1g=;
 b=Tsz/eQGXL68k2gRJq9fJuQW/eKX3FGKNd+jCAu46fJit8cK7HwUpYDSLkDF0wjZossOk/gYsFW55VuYgaZj8VomUDaConk/Wm1EzfS7n+OGGutTgngx2SUwk6N05igg8zHTWxm+UhpoAN7jSe/kkrS1aOvG5j3gJYuTOxXSjsp9dl8tlw2Lu39fwp8OX1R/axgHutTECry75q6kgt+BfYs9nw/zpwT+6D2mwBECQnsLHNxC3lIyerRXl7P1hNNdWZEmBwwsnk9SLSKcq/283yLnVJAtNM/B3mBBprqS6ZrGIB4QpQ4mWk/Nv+3yNzbqauWOSfolwSPZ0CtZ4/tfURw==
ARC-Authentication-Results: i=3; mx.microsoft.com 1; spf=fail (sender ip is
 52.17.62.50) smtp.rcpttodomain=bootlin.com smtp.mailfrom=solid-run.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=solid-run.com;
 dkim=pass (signature was verified) header.d=solidrn.onmicrosoft.com; arc=pass
 (0 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=solid-run.com]
 dkim=[1,1,header.d=solid-run.com] dmarc=[1,1,header.from=solid-run.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCZ5hBC4vS4isaE3e8lk1/JCLbqblxBQlEEAmWJTC1g=;
 b=pT/PWCHif2r/sDk6sICXBN9UAZ6dZhX1xhU/9aI4WuKIECnOPTjMm9PO3Y3riArUvFoAarqxbEiIAkpHrjzOI0XXJCruJaPqjpn0y3uIZiXMlu7haZVVWAWQWLtufsCT99xoFwg8Hlelzhrx3eYNcUNziX45LUm7e4yvJTP4l8s=
Received: from AM8P251CA0017.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::22)
 by VI0PR04MB11071.eurprd04.prod.outlook.com (2603:10a6:800:262::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.12; Mon, 25 Aug
 2025 17:54:28 +0000
Received: from AMS0EPF0000019E.eurprd05.prod.outlook.com
 (2603:10a6:20b:21b:cafe::91) by AM8P251CA0017.outlook.office365.com
 (2603:10a6:20b:21b::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Mon,
 25 Aug 2025 17:54:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 52.17.62.50)
 smtp.mailfrom=solid-run.com; dkim=pass (signature was verified)
 header.d=solidrn.onmicrosoft.com;dmarc=fail action=none
 header.from=solid-run.com;
Received-SPF: Fail (protection.outlook.com: domain of solid-run.com does not
 designate 52.17.62.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=52.17.62.50; helo=eu-dlp.cloud-sec-av.com;
Received: from eu-dlp.cloud-sec-av.com (52.17.62.50) by
 AMS0EPF0000019E.mail.protection.outlook.com (10.167.16.250) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.11
 via Frontend Transport; Mon, 25 Aug 2025 17:54:28 +0000
Received: from emails-9722785-12-mt-prod-cp-eu-2.checkpointcloudsec.com (ip-10-20-6-81.eu-west-1.compute.internal [10.20.6.81])
	by mta-outgoing-dlp-141-mt-prod-cp-eu-2.checkpointcloudsec.com (Postfix) with ESMTPS id 3802080083;
	Mon, 25 Aug 2025 17:54:28 +0000 (UTC)
ARC-Authentication-Results: i=2; mx.checkpointcloudsec.com; arc=pass;
  dkim=none header.d=none
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=checkpointcloudsec.com; s=arcselector01; t=1756144468; h=from : to :
 subject : date : message-id : content-type : mime-version;
 bh=JCZ5hBC4vS4isaE3e8lk1/JCLbqblxBQlEEAmWJTC1g=;
 b=qx7yhMlsOPqIHQTbjZigIq9nGFyy3PtNlHRby5E8CZdM/Hipu9WS37RRTG5HUzemw6Fzw
 qlhOGhwagUzpKUOFzXM1knzePqFjXU298XMv9OejHWVe9WyWNMAx69FlfVr77Vprc0kfoBM
 FjGCksPXPDZs0KxC2yn6nKLkMDR1RVo=
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=checkpointcloudsec.com;
 s=arcselector01; t=1756144468;
 b=PSmFPO0J/vSv8LXHEDYksEnS/j5P9yUKnjWsS8y1aN44+CPEBZ5hbSSxt1k8wFRSsDjWv
 zSsFIjJ+YrSAghrj7j6cmQMrHtNNJslUO+RTRCtHc7kV0ntTlECjARXw5+hmmGVgrI7Spem
 9zHyTmHYHrRmzy4Uu4XV0exemheXtvI=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEHpkpwqeacytbi0Qe9zYxcIGiwt0WMvsHkAJT71Ix5/UfT5c9qq3HNfsBeAq3u4sTzEJ7bxjzunT+NGg/t2e/Kp2TJT2qbCxHCU+GEuFYrAtNES4SdQbEM7ynngYtGo9zAUpSXZOz7XBMzVLLylKPBwNiWmyvdaPJPnc01xHBZlXgYlDjC86Pf33HbcPV7Ai24hvgH6y2DnsNNmjNQhVI20NTWW1FOyChtycNkk/SfZlehgTCfhYPebxBPdcBmmo2gaCvBeUgPKCZgJ52TdId02oZ+yDlZJQ7wj0e2R/4ViTN+++h95cQ1XwWxJzdDNIinGeXsJgv/k/yn7s0ScQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCZ5hBC4vS4isaE3e8lk1/JCLbqblxBQlEEAmWJTC1g=;
 b=EV5/yOJIYO+BkErC7PdPouYB3zJuZOzxB/dwFhApC7jJimhekpwy1wVgaHTjt4P9BWRdxDRbHZDRln6oarr5GAXxwZLf1GOK0evGH2TxiBYSYbAiWLIymbujSzERVj02ywDP6yY5/BGBwEonEzfQVqp1WxT9JysQZUtIHaylOwiT9PpCVhTM833s6b5UFiPribrOLjJEmjTeGSM9ge2wlemv8ViBmc8FXDoIylr9+yibEgKL3wEdmfh6do0dkA6P+FbqNNmZU8JzQaYgk0nKo4ouM9mABFnK3M64Ww2I4LVCveBB9Dz+HwyKIWawE8P5zF0um8tu8RI5QE0pzvMJUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=solid-run.com; dmarc=pass action=none
 header.from=solid-run.com; dkim=pass header.d=solid-run.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=solidrn.onmicrosoft.com; s=selector1-solidrn-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCZ5hBC4vS4isaE3e8lk1/JCLbqblxBQlEEAmWJTC1g=;
 b=pT/PWCHif2r/sDk6sICXBN9UAZ6dZhX1xhU/9aI4WuKIECnOPTjMm9PO3Y3riArUvFoAarqxbEiIAkpHrjzOI0XXJCruJaPqjpn0y3uIZiXMlu7haZVVWAWQWLtufsCT99xoFwg8Hlelzhrx3eYNcUNziX45LUm7e4yvJTP4l8s=
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com (2603:10a6:102:21f::22)
 by PA1PR04MB11405.eurprd04.prod.outlook.com (2603:10a6:102:4f0::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.12; Mon, 25 Aug
 2025 17:54:17 +0000
Received: from PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6]) by PAXPR04MB8749.eurprd04.prod.outlook.com
 ([fe80::aa83:81a0:a276:51f6%4]) with mapi id 15.20.9073.010; Mon, 25 Aug 2025
 17:54:16 +0000
From: Josua Mayer <josua@solid-run.com>
Date: Mon, 25 Aug 2025 19:54:09 +0200
Subject: [PATCH] rtc: pcf2127: clear minute/second interrupt
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250825-rtc-irq-v1-1-0133319406a7@solid-run.com>
X-B4-Tracking: v=1; b=H4sIAECjrGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCyNT3aKSZN3MokJdkxRD8yRTUyMDk9QkJaDqgqLUtMwKsEnRsbW1AO6
 53a5ZAAAA
X-Change-ID: 20250825-rtc-irq-4d17b55204eb
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Josua Mayer <josua@solid-run.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: FR0P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::14) To PAXPR04MB8749.eurprd04.prod.outlook.com
 (2603:10a6:102:21f::22)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAXPR04MB8749:EE_|PA1PR04MB11405:EE_|AMS0EPF0000019E:EE_|VI0PR04MB11071:EE_
X-MS-Office365-Filtering-Correlation-Id: 74d46bdd-7140-4fb4-fe79-08dde4006fec
X-CLOUD-SEC-AV-Info: solidrun,office365_emails,sent,inline
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?cmplbGl2TDZJZmlKSmh1VFBUYUdjVzQ2MFg1NWt0THNWak5wRUNHL1pMcHAx?=
 =?utf-8?B?VU1ZT0tYWWJ0Mm10OXJlajhTV2hsQnRtanhaYU5SeVZDOWV6MmI1RFhBYTJR?=
 =?utf-8?B?cnlEWnlKZjJMTVZJd1k1UnY5Qk9lMitjMmY2SkJWSnhGWjlHWHR2SDViVkZC?=
 =?utf-8?B?THhZU0hzbmVUMlFSTzNNYVRGbnF4aWJIencybG1JcEQ1SHhZNjFDMVg4YTFu?=
 =?utf-8?B?TWdlTGh5UWF4U2VLN1dHTXQyL3dBRTY0bHdhYktaYitvZU93cmlwaGdHcUF0?=
 =?utf-8?B?WG1LbHl4Um5YY21hYlNuUmJHTXF1QW02WmpKYy9XRW9XdEticjJTczZNbGMw?=
 =?utf-8?B?TWhIWnp0ajVjUUdmbnc5bWVSdU00L3d1OVdBUE5GNzgvMnpWNUFQMWpRcm04?=
 =?utf-8?B?N0RhdjcreFM2dWt0M3hJajhCRDJpMWlpc3FTcWUwRHhERjRzVFlCNC9RQ3NP?=
 =?utf-8?B?a3hFOEhCdlllWXY1VGdqOEsyTFVqSUk5VWJaUm8rYlZnSC9WUkYvUnFrZFNj?=
 =?utf-8?B?WEV2c3lQc2JYeE56Y1hKMlVZeXhyeDl5WE53WmY4QThYRDB3bGNyMWJWRkdr?=
 =?utf-8?B?ZnM3enRCZVZwNTRNWU5NbHZFZ2JTSkFaczBDLy84SWdPS05aTlRYN3BnYXN0?=
 =?utf-8?B?VUdGZmxwZzY1M2hTT3gyUGNNN1NOK1RwRWlMamUrSXh5NGZ1Z1BOcUFnYldQ?=
 =?utf-8?B?K2cwcG9wazdJak91WmtyZjFINmxHQngwbU54b1VXUW9UdFJxL1ovZmdoUldC?=
 =?utf-8?B?c3pjNW5OU1NDSVVVL3NTWVduTWtMd1pUTGlpMFJEd0tzdnFUVmVia1Y4TkM3?=
 =?utf-8?B?ZnlsM3pHQm5pMEJ3eFlBNkdWMEZidy9RdW81WlloUVZ1N215aEJoM2V2a0ZZ?=
 =?utf-8?B?SDBQc0w5b0FMSHVZb3A0dUgrM3B6REI1eE9UY2NTK3VCdTJtS2ltRFluWmty?=
 =?utf-8?B?OTBjQlk1QWZPY0dldk5zSXdoZytlMFRtRXlFaDVhd2ZXWVVSazlpUHlwUjBq?=
 =?utf-8?B?WVdtUHFlMHFaVE9YSmF6cW9FeG5zNXRpMVd5WlJuRTZLSEhmbEkrdFZ3RWV5?=
 =?utf-8?B?NC9tSWtSaVdydCt5VUF5Z1k1SjhVV0N2V3FJT2dDTlRwLzUySzVuV1krUVhJ?=
 =?utf-8?B?QVQ1WS9yNjZyOVY3U25CZjN2L1BQd01aOHhaeWJWNGFsWGpxWU91QXNYc0FQ?=
 =?utf-8?B?eGJQZldrS2VpUnJOWGEyRE5pNmVVNDJidlVDWGFUUXdPUWFZVFlieDIwT2Vj?=
 =?utf-8?B?V2lzUDNKYzdtdWRiZjdobWM4VlA4RS9UTFc0aHgwTnlwdnVkelE0UTlURmNl?=
 =?utf-8?B?YWFyS1pIQTN3dW04aUlZU0FDRWhTM1V5SW56eERkc3htdVh1WFVyQzVZM1Zw?=
 =?utf-8?B?dW56Yi9SUUphMXVkVVphNDNpbVN1UG1oS2JJVE9XQ2lPQ0MyUExiUURDWGNC?=
 =?utf-8?B?K1A1YXN2NjFLcWxaR2Jsd1lGczY1L295S3pTRzBHNTRSM0paNitvN0NTOUx4?=
 =?utf-8?B?S0dZNlh2UnhaOHpWajhVaFNWbVJyb005cnoydmxnRWNaa2dMQTg2R3hhNkp2?=
 =?utf-8?B?RFBiaG9qcUhaS0EzWnBDMG95VGszUWFUZnIzUUkwOUFnSGYwZXZHR1FMeTYy?=
 =?utf-8?B?bUdIaHpNdUtmeHZRSHFrNnVWTVoySDd6VGVQa1R4ekNCaW1oYzFCdmUydTY5?=
 =?utf-8?B?M054MjkxcFdSNUJOMHNvdi93T21qNmE5Qy8vbXZKR0FJSG10N01vVkdRZ1Bk?=
 =?utf-8?B?YmNFOEtzZ1RFbkMrTkMvK2cveFhkR0tvTm5Gc0pJaHlaNUlJeWxQWXZ2NjFH?=
 =?utf-8?B?akpPQTIrZFovaW1Xb1NKRzhuRWJ6anRrNE04U3NmVVVJeVBPdEd1NHdJaEFX?=
 =?utf-8?B?R3IvZTl6QUFxQ0Nyak82ZkFLa241eXNPVHdoeE9GREVScVdXWU5yYmFOQVIw?=
 =?utf-8?B?cDlhYzdRRzNHKzNOTzBBYUFtTExGaFhhTVVlVFBNc29BMVZoZkdzL2YzVGtX?=
 =?utf-8?B?U3VCTE51aU5RPT0=?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8749.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB11405
X-CLOUD-SEC-AV-INT-Relay: sent<mta-outgoing-dlp-mt-prod-cp-eu-2.checkpointcloudsec.com>
X-CLOUD-SEC-AV-UUID: a5741bd4f17e44ea8643f3bc4a3bd377:solidrun,office365_emails,sent,inline:43f71f6f1701830a8f606ee4f95e7c86
Authentication-Results-Original: mx.checkpointcloudsec.com; arc=pass;
 dkim=none header.d=none
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	44aae24e-8af7-4f29-692f-08dde40068da
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|14060799003|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?STlralJYb05DWXVaTFBCMGlHVVdRdVRDZC80VEkwVnJzNnNNQVpGSmJLMGNT?=
 =?utf-8?B?OXBmNjg5U0wwcGtOYXpoUjlWdW01SG91Qm1vYVNvUmI2bHV5OG1hNkxXN09p?=
 =?utf-8?B?NTErWXE1eDcvM2NoOTBSSEQvR1VuU3g4eTBPdGs3dlo3T2hTcjg2aHVqdlFq?=
 =?utf-8?B?Uk9sbnVXbHB3VVFUOStLZC9rNm05bjl1RW04V25iV1BEYkYzRTcxcjVWaldt?=
 =?utf-8?B?aE9SQVRJVmI1czZXY1E0VnhVbjY2aW14NmpjYjhVRTRPc01YSkIwTzRpZCt5?=
 =?utf-8?B?Y0M3WlFPQ1hpNmZzdmVtZ3F3VGhzTGRDbXFyN3MrWUl0S0NMK0NnL1pFdC9S?=
 =?utf-8?B?WWE2RkNNWUJOenoxbGp0ZTBzeFdwNmpjSTBBN1JRYzB5WnZiWTNqa0wvNW9V?=
 =?utf-8?B?K3JyUmxvZ2wrZ2ZsaWVIUjF5ZXNERjUxdlR6b1JIYkQ4bXFLUDIreGY0SjZj?=
 =?utf-8?B?a0YybUUwN21Iay9CT3Y0ays1MTdYZ0J4TkpvS2dVQWt0bk1WY0tTWmRmOERo?=
 =?utf-8?B?eC92U0dPYlQ2Y05YS0FVWjNlc0hFV1N0dy9ZNDFaUnYyeVRyZEtUdFpwTVk2?=
 =?utf-8?B?ZDF3aS9kTFQvakI1UzMxRnZjaEVYZHlLeWFYcVl4ZjN2eEl1OWk3SER2a1JB?=
 =?utf-8?B?Q3BURjNvS2pGTVJrNkZrSmkyUTZTTUJsUTlCSFIrOHNKTWpvWXU1RWtuM3Rn?=
 =?utf-8?B?M1Y3Z3ZhQXlzRStmWFZDZEdrZStmcklJdFhnZmhLRkJiR2Nsb0lHNTdCU0gr?=
 =?utf-8?B?VFkrUndNOWFpYmJkbnd5WlN0UEZQd3FNMVdvZ2hzTDhGK2dhTUVTdUNsNisz?=
 =?utf-8?B?c0dacXhqNXc0eFVIYVhRbG45a3drY1hGa2RFZlN1SlRVbERwdk4vWU5RQXR5?=
 =?utf-8?B?ZlYwZEMwM1FWR1VwZjcrTHUwMVVLUHY0cXY5RjJsZzNzaU82a2pFSSsrY2Jo?=
 =?utf-8?B?MzM2V1JOR2lzKzV6c3NaTjFVSWlVVnFTR01IdzM3c29zSGIyQjZwcjFsSGJv?=
 =?utf-8?B?N3pHNVpiOEplSTlKdE1oWWlJMXFnT2FOeVRLN0FsbHpZT2Y4RTZNcUh5OGw0?=
 =?utf-8?B?RUJzMkpRR1Q0NG5kS0k1NzZDTTg3Sm1YOEhIajd6MUwraTVwd0R2SWMwQ0JV?=
 =?utf-8?B?a3pwVnBHNXpjY0FZTFpDWlVTYXdjRlF5cFA5aFVzWHVLTlBaaXhlZVhtUGhK?=
 =?utf-8?B?VElhRkdLMXhDVkJFd3BwbFZ2dTRmaEdBR0NhdUtrZkxnblBwN0lOZi9yUHQz?=
 =?utf-8?B?VDZDL1F4Q0F2VXg1NDZTZlFJUkw3MllscDdTZlBiMEl6ZUJ6dVFVbGt6a2lz?=
 =?utf-8?B?aWpXVFUxYVpRUlZMdkQ1Nm1rRUZpbDhrUjJnQStNanRvTVJXaWx3K09MYjQx?=
 =?utf-8?B?T0MxSFUzNDJ3RFBXQXFocFVkSW1PNE1LMFFtSmdpbjVXZzNtalZqcFhVaGZj?=
 =?utf-8?B?Y1QvRGxxdGZzcW9DSzFwN3FtQnZXcjlkVnpYdVJnSDc2U3RMdzJCNE1FTmZR?=
 =?utf-8?B?bFcxeENVMEt4OWtrT2d1SVZNWStmQWFNbWg1R2gvaXhQalZEc1NWRzBMa2lS?=
 =?utf-8?B?WXhMUEVsaFFJdm8yNGVxODdzMVE4aXFXN0U5QnhIWFJMVWtOZ0h3THB1MTF4?=
 =?utf-8?B?T2xYbENwYlZMOFduR1RiYUl4TWZiUVY5ZitkUlBybzI5RS96SjNObzIvdG5s?=
 =?utf-8?B?Y1FFZTlWWVk4U2l1R3dqdXdubVpocCtHL2gxd0M3bytDbFI3UlJWOTlBaHYy?=
 =?utf-8?B?WHE2NVdmRWpHUitseFl5cDh4eVlLVUhPcFZDbUhET1RrRXhPdEZoY2xOTEFl?=
 =?utf-8?B?eHVnQ2RHS0QxQk1nM3E0Q1VHcTg1MHVIenFjZ25xcTJDbEszRVlBdS9XU0Rj?=
 =?utf-8?B?ZEdDSUJIMWhJUkYyaDlKZ2swSVBlTHFIbVhRNjhXU0lyVzZZT3YxZEdhTWRl?=
 =?utf-8?B?bFpzMUtOenRIRWpoTFlaa1NFR2xvN3lxc3dGYVdYNjhNNGxnSnpRMnBZenEz?=
 =?utf-8?B?WWpSMW1BMFFiY1Vtd0xRNldHSGI4TVRGckJlc2JPNVNFcTR0a3BtdkVWa2lG?=
 =?utf-8?Q?3QBfc3?=
X-Forefront-Antispam-Report:
	CIP:52.17.62.50;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:eu-dlp.cloud-sec-av.com;PTR:eu-dlp.cloud-sec-av.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(14060799003)(36860700013)(35042699022);DIR:OUT;SFP:1102;
X-OriginatorOrg: solid-run.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 17:54:28.4548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74d46bdd-7140-4fb4-fe79-08dde4006fec
X-MS-Exchange-CrossTenant-Id: a4a8aaf3-fd27-4e27-add2-604707ce5b82
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a4a8aaf3-fd27-4e27-add2-604707ce5b82;Ip=[52.17.62.50];Helo=[eu-dlp.cloud-sec-av.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11071

PCF2127 can generate interrupt every full second or minute configured
from control and status register 1, bits MI (1) and SI (0).

On interrupt control register 2 bit MSF (7) is set and must be cleared
to continue normal operation.

While the driver never enables this interrupt on its own, users or
firmware may do so - e.g. as an easy way to test the interrupt.

Add preprocessor definition for MSF bit and include it in the irq
bitmask to ensure minute and second interrupts are cleared when fired.

This fixes an issue where the rtc enters a test mode and becomes
unresponsive after a second interrupt has fired and is not cleared in
time. In this state register writes to control registers have no
effect and the interrupt line is kept asserted [1]:

[1] userspace commands to put rtc into unresponsive state:
$ i2cget -f -y 2 0x51 0x00
0x04
$ i2cset -f -y 2 0x51 0x00 0x05 # set bit 0 SI
$ i2cget -f -y 2 0x51 0x00
0x84 # bit 8 EXT_TEST set
$ i2cset -f -y 2 0x51 0x00 0x05 # try overwrite control register
$ i2cget -f -y 2 0x51 0x00
0x84 # no change

Signed-off-by: Josua Mayer <josua@solid-run.com>
---
 drivers/rtc/rtc-pcf2127.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
index 2e1ac0c42e9323dbc6793840a265e8a663e52568..3ba1de30e89c22ae07ea319d530b58adc25b520d 100644
--- a/drivers/rtc/rtc-pcf2127.c
+++ b/drivers/rtc/rtc-pcf2127.c
@@ -42,6 +42,7 @@
 #define PCF2127_BIT_CTRL2_AF			BIT(4)
 #define PCF2127_BIT_CTRL2_TSF2			BIT(5)
 #define PCF2127_BIT_CTRL2_WDTF			BIT(6)
+#define PCF2127_BIT_CTRL2_MSF			BIT(7)
 /* Control register 3 */
 #define PCF2127_REG_CTRL3		0x02
 #define PCF2127_BIT_CTRL3_BLIE			BIT(0)
@@ -96,7 +97,8 @@
 #define PCF2127_CTRL2_IRQ_MASK ( \
 		PCF2127_BIT_CTRL2_AF | \
 		PCF2127_BIT_CTRL2_WDTF | \
-		PCF2127_BIT_CTRL2_TSF2)
+		PCF2127_BIT_CTRL2_TSF2 | \
+		PCF2127_BIT_CTRL2_MSF)
 
 #define PCF2127_MAX_TS_SUPPORTED	4
 

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250825-rtc-irq-4d17b55204eb

Best regards,
-- 
Josua Mayer <josua@solid-run.com>


