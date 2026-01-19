Return-Path: <linux-rtc+bounces-5783-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A6549D3A3C2
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 10:53:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8E74308389C
	for <lists+linux-rtc@lfdr.de>; Mon, 19 Jan 2026 09:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64FFC3093BC;
	Mon, 19 Jan 2026 09:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="AuHcYnse"
X-Original-To: linux-rtc@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11021115.outbound.protection.outlook.com [52.101.70.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7BE3064A2;
	Mon, 19 Jan 2026 09:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768816316; cv=fail; b=tKLgsu/HA+QE5dpuuQDWzuj0GXZa6cOlRbpGw7/Lse6EM8PNWHuPC3l2s3gMjVXPagEJXJlZjUZuBh4rsm8J2dDGvf7oUzPLGH33/ncmAG45Etb5DRKviCcLFME3tNraMdv1hZy55rDUD+3qWO/9VqBWxXRmPWtDWhayw9fVhLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768816316; c=relaxed/simple;
	bh=XuIoYz1Zt3sAF6ivU9DohavdMJWx7UHQ0knKcUeh8mU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=i/FFhCyPmtQ1e8PuUOi1HEtPTQ92XFdqrM9V47RGEbbz/zNxVw2yVNqdbE4MGEQ1bN3D/Yfwb0YZMIIjAsRCSIhFDBCWWOAyhVov3cEl82yR2v9N1Hfn10/eTV5qir5ZNG7YdCS0nhpvPkpeF+DGegniNsPkDmhxfPj++cVXAPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=AuHcYnse; arc=fail smtp.client-ip=52.101.70.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3NtlVzl03tbwqpnbvd1D2KwRgUzlQqSMnZtZuC9ijOyVXq2YToxspHXfcILDjnFFpesu/H2CTdnagdgkYhf5eVw36rME7fDOnnpGqm2Hjsw2Yo56LGGOO0ckWGpe/gVudWMeyzbQD0QHwDlXuIfpMQC2LephHqTDcOM9g+XVJR4AlA/b+IdnJXdc6EDTmgsN972paFrbDie0Mt7YXETLspFpE5p6Sa+wW5gR/+b6Ko5YIi2wTJwyM9CsGOW0vrwrz67WSsXCnHU1ed/QgdIlee3wbc4Pit8xyJJcY8QJgoobRH/am363BTo8WuAZtOUqxLw0rBDPvb7Q1sd/43tHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J6qOK69IiS51dGybtyWjGH9PHv5oVlUBx8XiFHvFGbs=;
 b=C8Y5j6oSGb6PL6IMg8R441YjjY1IVUfhWQflekbrwomPAWNrJOnDhClz1drPDBgWkLGaOym+s0pLvrmF5+bL3bT0qzR+t00x1uFpElXcPmvHjavbHOMCxTMCQV5ij57TV8DydOKjKmBjR60+rxLUBoGQDL1EcuZMfcd43r/f1PDgxvCutxBsCPrSvffvyR+vAJWZ+lmNWMdMZgCO8ETWRR+ZN1aJ4EevW5tDJqolPG/C6uTpogRyrvIc+HdG6FVeSbDIti47/Q3Jq8jMMqK/mNpfJ1SMnxzmD8VxSp9q3TMlQDm3SFUkU3Vc3P4dMp4BW4xmur2HtnlVygIB0pz64A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J6qOK69IiS51dGybtyWjGH9PHv5oVlUBx8XiFHvFGbs=;
 b=AuHcYnseUAZ7sx5uvKXx9JJ71mQgAH7OFC0QloPZ93zMrAUl2js5ZKyj/67RV9/18OdHtAi9/ycJE8KRF1325udvBORTiCufllnf5YwCC1SDichT9fMyafrk0NpezhvGwUp3dl9Bv6VRRiQD5RUtJMCDPZQG+rRK7+QK6gZ55rl6BbU2UiR+905KkggMUlyW/mG1m+tJb6f3MK4YeWJTaoqKzBrta0oiNZh4PHusfC9UBUEJ2eitVFkAQyM3r5xuDModLU7jRGw5kyJqJ4uDWViuicnGUQTkxig56soHyRXXpM8gFScJi7LTRTAqozu+IO2OhZQtVruTlBRyNzCpAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by PAWPR06MB9950.eurprd06.prod.outlook.com (2603:10a6:102:4c9::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 09:51:50 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9520.009; Mon, 19 Jan 2026
 09:51:50 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Mon, 19 Jan 2026 09:51:31 +0000
Subject: [PATCH v3 5/6] rtc: zynqmp: rework set_offset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-zynqmp-rtc-updates-v3-5-acd902fdeab1@vaisala.com>
References: <20260119-zynqmp-rtc-updates-v3-0-acd902fdeab1@vaisala.com>
In-Reply-To: <20260119-zynqmp-rtc-updates-v3-0-acd902fdeab1@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>, 
 Harini T <harini.t@amd.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768816307; l=2585;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=XuIoYz1Zt3sAF6ivU9DohavdMJWx7UHQ0knKcUeh8mU=;
 b=M02fqOAqe+kKj3BnGGXGf22lgE9piXGRkdwfJA5xRsYu/K6EZwg2M4iPeREH6I0G5gBmACFMJ
 3bHNtT78drECIN8zNI97Uzg/ZhkqnENkRtrOg73kaoFz91I30U2lz3Q
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GV2PEPF00003827.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:5:0:6) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|PAWPR06MB9950:EE_
X-MS-Office365-Filtering-Correlation-Id: 58f17459-18e8-45d6-718a-08de57405e47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDd3VzZjenkwcGZKRmxwWHNXMFJ0cUxFSmIwMXF1TGluVHB5dEs5ckZDNUpp?=
 =?utf-8?B?anEyQ3cxZTJ1N3o1amdtRWlpblQyaWFSb3l6YXV6SXJyeS8ya2VBVTEyc2ZR?=
 =?utf-8?B?ZkkvQkhMQzNoVTl3YW03MDUvclVSa2R4MmdoeUN4TmtJN0c0WEpJR3RpWkhq?=
 =?utf-8?B?b0QrM01HS2NyOXRidjUybFp0QmpFT2V4UnJVVEpzclN4Y2l1NGNhMm5aK2tz?=
 =?utf-8?B?K1ZjbUhuQVpEdVNza2Uwd3o2R0ZXSk0zR1RTa3V6OFF0a01rR3dIT3pJb1Ar?=
 =?utf-8?B?eTFyUWdKMTY0WnFUZGxkRHNIcVlPYWlCelJTSHpSUE10WDNtREk2K3REamdv?=
 =?utf-8?B?dzV5UHorM3FYUitBdzVZWi9iSHJuN215TmN1aVJKVTNqWkp1eTR6TzBzd1cw?=
 =?utf-8?B?SEFKbUpiaXBnUGQ5aHpLNHlmRTBMbE5ZN3dyOEVBUmlSanlhUFNMSldneGpI?=
 =?utf-8?B?M0JDb2RWY1ZYNFVuenhQVTBjTExYazMwU01IcElvL3owM0lQSlVLeUpQWnNp?=
 =?utf-8?B?TmN3MnhQQ0MzMzdINGx1Y3NubnpHVVB3RnJxTnlnMm9SZUIvM215blBLeXZa?=
 =?utf-8?B?U3Uva01SS0Q1eGpGd0pIc0N6aXRvdEZXOGxhSkxmaWtQdm9GSXdnUG1qS1dB?=
 =?utf-8?B?TC9TdEZFTExaNWd6S2dZYng1SXBoYXk3dS96QUNMUlY0M3NqSFF3aG5VSVJv?=
 =?utf-8?B?SnI0MXB2bFpJdmo2OUtyaGxnQkU2MHdWYTZHclZ4bWRraE1nMzRja2ZpaW1r?=
 =?utf-8?B?NkV6SmI3VHE3R0c4ZXdHSnhBR211c2tMZ3h3M3RDc0tmV2NWMkFRSVhzMURZ?=
 =?utf-8?B?S240b25CbVdxenlGWmIvbEtKbHgrSkFRSVdNdHp1RFNNRVdRWGVWNTlteWRY?=
 =?utf-8?B?SjdvQU9rMmhKdlJkd2xwT3ZPbkh3T0RMdy9PYzJTT2VGaXZOeHFpcFg0dkdw?=
 =?utf-8?B?MzRReW1BL252SkJpMXp4TGxoTmhrUEkrVnhTd2E5clZTalZYcHlrUFBCZnJO?=
 =?utf-8?B?UjgzSzdCTmdlVHVLMkVPOWw1bUlJd2RmQVM3c043ZWNDbGZIS3pBc0lHV05l?=
 =?utf-8?B?MW1xeG9qdFZOcHdZT1AzVFBxdkNUNnMwQ1RMNkMzQWdFUGEzWno4M0FrL3dR?=
 =?utf-8?B?b0VhdXVicDJMeURrUm9JWnA2YzdheWtKUGRTeHE3RWlNZWFRL0l1TlBlQkFa?=
 =?utf-8?B?anFEcXJiWVR3aDFYdzFwc2FhbzVhdVZ4bytlbEJRbkdiZUFCYXFXbUlGYTc3?=
 =?utf-8?B?TXBJVDZFVGp0cjk2N1IrZ0JHSG9MbXpiSDNiYzloejkvY2NDemR4eGNGMFE0?=
 =?utf-8?B?VFdqM3RjWjBlWHExbEk0dDhhN21yN3dtOEVDcWIxbGcvRUh2Sk0xR2wycjFR?=
 =?utf-8?B?dVUrejFYUCtyZXEwbHdzaDVweWQzQmhGSzhLdzBzWHVYYkV0OW5kaFVCcjBj?=
 =?utf-8?B?V2NaVmVGQk4xdnQvVUF5SnNDc0V5dVZDRy9qRVRKK3M5TWMwZy9sMnlOS1hV?=
 =?utf-8?B?WGZRU0c3SE52UjRjMkhTVmxic0VrODBBVWNENVF1YU9iYlcrNUZEQnFtR1px?=
 =?utf-8?B?eTBtSGtaUUhmQ1p5d2ZWdllMejZabzFFZzZQMVlHOU5RQjhHYWZLTS9ydjVy?=
 =?utf-8?B?N2xHc2hueHExK3YvYkhFcjkxM2UyUzR4VG1MNmJSc1FxajJPcDVOaVFpLzVZ?=
 =?utf-8?B?dW1VK2VlQmM1dW5NN055eUVLMzNOMmlHZ1A0TEZ5bUNLWWxNbnMyVG5PbFpt?=
 =?utf-8?B?Z3lzLzc4WHB4N0JZYlpac1VOeTF5VmU5VFBvWnIrbWNXNjNFZ2tRajR1S0hq?=
 =?utf-8?B?ZnZHK0pqMnloNWs1MGhYUWF1VWRxM3cvNDVzd21EcjJyNWdxT2h1bG0zVmpp?=
 =?utf-8?B?NC9MWHFtNVRDdEdHYVhwSmFVblprRWtPdWozSjZON3plRmhlVGJFekxyNVdU?=
 =?utf-8?B?bkhFM2ZwL1AxTFFlbjJjZEp2aUJqeE5jcUcrRXEreUZMVHRsTXJhQi9Ja1Rs?=
 =?utf-8?B?WmJlREt4VXdqK2RkZnRJd2FiY1RPNkszY3EwUFFoTU9lbzVseWRhRzZHOVZn?=
 =?utf-8?B?K0hSWVBFb0VPZXFKbXV2WlhMN2Y1cnBwYUlIU1F6YnBqZDdxM0JKeWJaNmpI?=
 =?utf-8?B?RVJTcUsxcW1tdjhkdUtKWGtvd3NqYU54Q0VCZmNITzd2WTVQTzVTVnozUVNx?=
 =?utf-8?Q?vJh1TR6Aq433nt79gfnQlCs=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VUd0SWpKUDFjZUNjQnE3QlRzdjBOOWRLL3pNRHJTZmNnQUtHa3dZYVk2RVdF?=
 =?utf-8?B?czUxQk5KQjZEaktGakFSV20rUWdEL1JZT1ZMNGRmdVVVWnZxZDZQendMYWgv?=
 =?utf-8?B?RjBnaSt0SnZnZE8wTkxKNzJ1OGt0MXZtUGlTMWt4eWE5bjlqU1hjb2xVQ1lC?=
 =?utf-8?B?TnVzanRxUXE1UWV6RVpYM1BONm5wNGxQRXUzdit3WCtJdjBySWZEeTlOdmhQ?=
 =?utf-8?B?blpNUDliS2RINjBwMFhvd1VVd2w1K29BMGZYdzh4VzBndVRGRnd5dkZ5NjhW?=
 =?utf-8?B?RzVVVzF4SFI5M3E2alpBVXR0RXBFY2tBSlVIUzBralBhT3pta1I0RmZsWFZw?=
 =?utf-8?B?Qy9GTUhzRGRxWDFKZTluZVRWWk9iMFFMQ0Jjb1ZSZUFjUko2VzNUVXhtYW4x?=
 =?utf-8?B?cHhlejJGNHVkbWdsVm5ucFYxQzdZS2FoLy9EdCt5RS9BQUZUaU1JT3FCMmJL?=
 =?utf-8?B?dDAvMzA4YVVZZzNRUndUS1JhdTVBZnNTWmpFb05JVVhacWRuazQwYTNORmNT?=
 =?utf-8?B?TFhnSXlKQ252Nk5WMExIOCtScklWdEduTWIwUHBvY0NpdXNMeE5rZDJZYkpy?=
 =?utf-8?B?Vnk4TFIwMWZ0N005LzQwT2pCUUJsZE5GbTdIUk1TYWRXYkFadGh3dFhqdEtl?=
 =?utf-8?B?TG5Ya2FnV09idit6UExvWlg4cThBczFvRTZyL2VFTS93clBQTnNpektRRTB3?=
 =?utf-8?B?Y3c4RWhTSHlraThVNiszSktsZjQxU0ZnbzlEY0RMT2FXc3JhRlFOK3pPeWxi?=
 =?utf-8?B?NGVXcEFIZzlGUHp3Mzlxd202VkV5bmNWcWliVDlvQ0dZK21xd1UyWlRBdHFF?=
 =?utf-8?B?NHAyYUo3OFU5R2xvOXUyZ1dDbnBxVTlVemdCN0VtQm5US1l6eUxuZG9PQkJn?=
 =?utf-8?B?bHY0dkVJam5kVXE2OE1tYzl6ZzQ2a2hsd1ViQ1FzeHpkRHg4VEhOVkhaYWlh?=
 =?utf-8?B?TkRWMVhmaktvVXpxNUNRUnl5TVpGSU5tWGx5NXdIN2tOTkwvN0dERlIrQUFr?=
 =?utf-8?B?d1dWcG4vNmtJcENmREErNFVET0NtM2p0cGtWVjhrdFlwLzRHN25NTC9vTjY3?=
 =?utf-8?B?bmVQWm9HWE0xNWFPdE5TVTF4L29jS1BzUmZ0aG9uUXZLZk9OWU8rekZhYXdE?=
 =?utf-8?B?ZHpkemdwUXQwTWFQbUJPMEFyaGE5RllWKzJYdFFQY1ZzbVpHVjE4UXNuNXBG?=
 =?utf-8?B?c292UG1ReHNvQkE3NzBpb2pHNHFYSHVSc0VNTy8vRDRnWDR5M2hReFA3WFRj?=
 =?utf-8?B?RzYza2k5L1F6enBrbUppeDRZM3ZaNVAwWk0vWWVoeHZwcUlLNm0yT0NJS0x1?=
 =?utf-8?B?bXl4b1ZzZkRoMHE4ZEg1MkdveDlhTXRkYTdwUGdCTGN0dFVhdFM5Vlh4Z0JC?=
 =?utf-8?B?enE4TnJpSVR3dS9wR2tUT05iZEdnQ3V3a3VaaEJ5dW9Qb1pGWENaSXJpNytC?=
 =?utf-8?B?UFNiVVdPVThHVEoxWHRXTWVWKzlxYTh3dlBld1VKZVZuNmNwRGRLUjUvWFA0?=
 =?utf-8?B?enpHUEZjTFY3TUNTcHFwZE8vcndMaVRhZkJPcW1ieXJhM1ZoVi92VWZPa2Qx?=
 =?utf-8?B?SzBCRnJZTHNPRkl6TXhGc3V6a0Q1Y0c5Q1ZuZE96U3Fodk9KTGVMeU9tdXAv?=
 =?utf-8?B?OThtMTlNTkpoYldWdmsxM2FKTDhzd3ZrK0VKc0dja0RVajBrQ0EvNThvdWYr?=
 =?utf-8?B?eURwdVNBYW9NUnVPYXlHVGdqa2hKUzZ5MklWcTNyOVlwUEh0bVZoZzdKc3Nm?=
 =?utf-8?B?VThPcFFLcjFpQ0IvTHRZQUt3VExxR2tsKzR0VHgzekd4aVdFOS9BVEVrd2I5?=
 =?utf-8?B?czdGcEp2N3JHRkpDa0VNNk9qZkRoYngrZlhSRW5MZENsMGlJSnZzZktHQ1Aw?=
 =?utf-8?B?cXVjMWk2N1VYL0x4V3hWbU1pR1NOSFM1aXBlL3ZML0hxUWxIWmIySFFKRTh3?=
 =?utf-8?B?Y1l1V3hxSEx5TTJQMUxMazVPRHE1VmRBdVFodnVwUlI0YXVzSkN0SFVJNnlY?=
 =?utf-8?B?blJXQTZwZ2c5QVh0M2dOY1k5TnRQVG1BdkJLK0dHR2h1VWc3dDJDR2JOS0Nu?=
 =?utf-8?B?USsrZTk5dHhjYnJwYWcxRHhGanBYYmg0Yk5PbFpLMXVrbTRONUJ6YkhhaXh1?=
 =?utf-8?B?YkliOVlsYTZLYmZMdjQrNVhHRFg3N21LdWVYajRhREN1SHNHOWF6aUE3aEo4?=
 =?utf-8?B?WkpOM0lodGFTeSs1VlZGTk4vWC9CZy9mUStmdGFHcDdmR3ZPVlZ2VFJNL3pN?=
 =?utf-8?B?RitEcERPcUF6dXpURUJkYzBtNW9rYnlvMk10VEhWSGpvN2JxNkpTNEZiU250?=
 =?utf-8?B?UXBSVTkrYzljOE5zUzJrZDFEN0toTWJ4c2VxeUM4RjJVTXpCMEtsU1hrTlQz?=
 =?utf-8?Q?Nl8HDx0MzpP3Xw3Y=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58f17459-18e8-45d6-718a-08de57405e47
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 09:51:50.5110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6D5DUDCKtYR8W01K6k8N0X7FYyr79CkVvoF1ZhNXyhwTMjmWZzbpl8r5L/u3+ZyYv6GzZKPvw1UCnma3nv/XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR06MB9950

set_offset was using remainder of do_div as tick_mult which resulted in
wrong offset. Calibration value also assumed builtin calibration default.
Update fract_offset to correctly calculate the value for
negative offset and replace the for loop with division.

Tested-by: Harini T <harini.t@amd.com>
Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/rtc/rtc-zynqmp.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 6740c3aed1897d4b50a02c4823a746d9c2ae2655..1bc957b3a9058aa1d809696c13662ecef0437a92 100644
--- a/drivers/rtc/rtc-zynqmp.c
+++ b/drivers/rtc/rtc-zynqmp.c
@@ -208,13 +208,13 @@ static int xlnx_rtc_read_offset(struct device *dev, long *offset)
 static int xlnx_rtc_set_offset(struct device *dev, long offset)
 {
 	struct xlnx_rtc_dev *xrtcdev = dev_get_drvdata(dev);
-	unsigned long long rtc_ppb = RTC_PPB;
-	unsigned int tick_mult = do_div(rtc_ppb, xrtcdev->freq);
-	unsigned char fract_tick = 0;
+	int max_tick, tick_mult, fract_offset, fract_part;
+	int freq = xrtcdev->freq;
 	unsigned int calibval;
-	short int  max_tick;
-	int fract_offset;
+	int fract_data = 0;
 
+	/* Tick to offset multiplier */
+	tick_mult = DIV_ROUND_CLOSEST(RTC_PPB, xrtcdev->freq);
 	if (offset < RTC_MIN_OFFSET || offset > RTC_MAX_OFFSET)
 		return -ERANGE;
 
@@ -223,29 +223,22 @@ static int xlnx_rtc_set_offset(struct device *dev, long offset)
 
 	/* Number fractional ticks for given offset */
 	if (fract_offset) {
-		if (fract_offset < 0) {
-			fract_offset = fract_offset + tick_mult;
+		fract_part = DIV_ROUND_UP(tick_mult, RTC_FR_MAX_TICKS);
+		fract_data = fract_offset / fract_part;
+		/* Subtract one from max_tick while adding fract_offset */
+		if (fract_offset < 0 && fract_data) {
 			max_tick--;
-		}
-		if (fract_offset > (tick_mult / RTC_FR_MAX_TICKS)) {
-			for (fract_tick = 1; fract_tick < 16; fract_tick++) {
-				if (fract_offset <=
-				    (fract_tick *
-				     (tick_mult / RTC_FR_MAX_TICKS)))
-					break;
-			}
+			fract_data += RTC_FR_MAX_TICKS;
 		}
 	}
 
 	/* Zynqmp RTC uses second and fractional tick
 	 * counters for compensation
 	 */
-	calibval = max_tick + RTC_CALIB_DEF;
-
-	if (fract_tick)
-		calibval |= RTC_FR_EN;
+	calibval = max_tick + freq;
 
-	calibval |= (fract_tick << RTC_FR_DATSHIFT);
+	if (fract_data)
+		calibval |= (RTC_FR_EN | (fract_data << RTC_FR_DATSHIFT));
 
 	writel(calibval, (xrtcdev->reg_base + RTC_CALIB_WR));
 

-- 
2.47.3


