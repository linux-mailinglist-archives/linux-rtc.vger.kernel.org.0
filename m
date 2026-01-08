Return-Path: <linux-rtc+bounces-5695-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C56AD03233
	for <lists+linux-rtc@lfdr.de>; Thu, 08 Jan 2026 14:47:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 301E3304655F
	for <lists+linux-rtc@lfdr.de>; Thu,  8 Jan 2026 13:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 017F3470BAD;
	Thu,  8 Jan 2026 12:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b="3VcxkLFW"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11020078.outbound.protection.outlook.com [52.101.84.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4F4E445EE0;
	Thu,  8 Jan 2026 12:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767876707; cv=fail; b=b7j2tj6PJ+uTktzqYdqc4u9a2roXdZI4jNAcS6WNi+XfoLOldYcvvuLWModhmHuxdWrLCx2EU990U8aM40aIX+5GE8ock81VXnQDceudkREEf89IxUAICiS9fm130gJTZjgD2z5FgLueHTPcdPCk8Cq5bFyRW6nEm+E9QFTzV6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767876707; c=relaxed/simple;
	bh=5L0aRB316zCfkJ1jTbmu+D4VbJ0BuoDRLgr3aeyBp1o=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=oAKbVrB3ozBRQDrEEwVGa+D3TTucPfFmN41sGAT4eNSibIo6hE/VSKLwDF5L6olDCaqgEAPYtxOym9qVhd4WF6q7GqZ5sDuOYYecqYcIK0ZtKeiWasqKRxA+3vSTLm7EmKwVLz+DDH2rTCroCFRfchBN/dF8Gff0BB878ueeOIw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com; spf=pass smtp.mailfrom=vaisala.com; dkim=pass (2048-bit key) header.d=vaisala.com header.i=@vaisala.com header.b=3VcxkLFW; arc=fail smtp.client-ip=52.101.84.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vaisala.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaisala.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZqV7ea1Ea5bqAvS43BZk0ICuoUsNN19Alu4e5C/jidOyvB4QQ+rfhJScjOMMWSk1+dfusL79csItttNyHhWOpIkANSQxOg1QSBFqDWY08ZHk1Q6ne1y8i8CZMFq6dYr9BnME0evQgGnTc0cLd3b5+jM/JERphi15/BBhN9wWm0LjSZc9Lzl0vrj+l74t8QJd0YIsZCD6sNFNg+lXQjqrur+xBNmCkHVHw6GYqYQbU35YNE16IiXfctAnNHlhXWwuwN+ZAxSydS1hvkccup39FBoIGcDqlTcvWxSUJIVM1hsfOPnLFh26O9NZ2JLo1NStY2xQdwX+9MPHQavmf0MDGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNUPAUeIMimSryd1aRsm3ingiflhqAOG+3X9k/fo6/k=;
 b=yMX1lKHPVgsP7drP2cbJjmJEcxZqDCpQ1UMub90kyxIdGJuIxCq00vDOajlucb5ltRo1+zlmUGFxLHwZOrr1k7PJZzFRyBGnv3/rxxIlUsFx19XIlVrVYXX4P0kDNq+j3CDjr4+D+Vk/hl12iHtBvfjQMSC++zcgos7LElacNdXGpAMHXeBXfmd6GPG8orgDxwVGLu77t6q2phlpuLRnfr8LRYcMAehwxB6wv6+hhPYoBSNYHmQ2QlLTFTML0nRfKDTGk3aQSj5DehC4JaF0h+7gArJ2OphyWprLhVU3U62FQxEO9gsdD/VBtFW9oiM2FZwQnxTE+Y74ojRo5YUtxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNUPAUeIMimSryd1aRsm3ingiflhqAOG+3X9k/fo6/k=;
 b=3VcxkLFWe1cPWj/dDNJmKc3xk5BJajtiMn2f+OmExJOcN+xGgLtSELZrxXuVOUn264I887WzastD6PBLBBnTCQPthDhSh6hIVOc0IUJ4QwyHygiP/igH/oh3Pblad7J46QU45DIKuZrKzCGglhlSU3Ub4rNisup2fLCxD77A2l0+ZkbhM6mn/lWx+vlkwuSlZUlMQmdi3RyfQAViAr4rny2k0yaXfGvDJR01zndw4UHbES/sy5fEl0PhpHtg/iFw1m2S8rPSNWsKrfHVKWHqudQG4lB/fDsNeqoFas2CRmqDI94YIGKnsNy1LPz0W7rvlC4n+uWSKFaQsVc5Hi0v7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com (2603:10a6:20b:6f0::7)
 by PAXPR06MB7456.eurprd06.prod.outlook.com (2603:10a6:102:151::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 12:51:28 +0000
Received: from AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede]) by AMBPR06MB10365.eurprd06.prod.outlook.com
 ([fe80::4606:8e25:96e6:bede%5]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 12:51:28 +0000
From: Tomas Melin <tomas.melin@vaisala.com>
Date: Thu, 08 Jan 2026 12:51:15 +0000
Subject: [PATCH v2 4/5] rtc: zynqmp: rework set_offset
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-zynqmp-rtc-updates-v2-4-864c161fa83d@vaisala.com>
References: <20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com>
In-Reply-To: <20260108-zynqmp-rtc-updates-v2-0-864c161fa83d@vaisala.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomas Melin <tomas.melin@vaisala.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767876686; l=2545;
 i=tomas.melin@vaisala.com; s=20251125; h=from:subject:message-id;
 bh=5L0aRB316zCfkJ1jTbmu+D4VbJ0BuoDRLgr3aeyBp1o=;
 b=tR3ePJ1qCmTP6Phg0o3kuVCoEPtiP0ndGeSnH0ELvNdhbzaoNc1YPUfX8iJLahQCiH7Y/v1Cq
 e/YViHezWYGCtwhTdIP62/jgYk3qXziJufFlmvGNZyWNrJSGIleiXZ9
X-Developer-Key: i=tomas.melin@vaisala.com; a=ed25519;
 pk=6lMiecjZ+OeyZuxYsDm/ADy9D1JKvYrKdsYv58PMepU=
X-ClientProxiedBy: GV2PEPF00007567.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::3e5) To AMBPR06MB10365.eurprd06.prod.outlook.com
 (2603:10a6:20b:6f0::7)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMBPR06MB10365:EE_|PAXPR06MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: bc517884-ff44-476d-ada1-08de4eb4a3ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N0UrUXhZVHZob3VMM25kWkcwbG9VY1ZOcWJvSmI5cHYwc2hhKzJFSTlUcDFx?=
 =?utf-8?B?M3VoVnpKdmtkVk43WlF1VWUrTVBYdHJDRE41Zlhpb0FMOVcvYk9SbWVmSlMr?=
 =?utf-8?B?RDQyZTV6c3V3NStQRHJQUkpuU2tLa3pLQ0xDVG5mTUpvUkRTWXdkS0RQTWRT?=
 =?utf-8?B?cE1DQTg2N0tVRVJVY20vT2RnUDJOSlFncUFpTyt0SExDKzdhV1VjTzZyS1dm?=
 =?utf-8?B?bU9ST09uUXhrcFlPckVZZDNORnhzVkYzMFp5UkhMcm15ZmFBa01KUzRRUWtN?=
 =?utf-8?B?SDN2K2wra0NsNE13MEt2bWFaeHVGcyt6cDdMWVRNWDVRb29yQmdsL2tVdHRs?=
 =?utf-8?B?WFhTZ1dkSVBqTFF0QVFWaVJGekF4eTlzMzJYVlFncUFSNUJmS3dvZHVEWlJP?=
 =?utf-8?B?NkNVOWdSUndDVWVIMXF4eWI0MEtXTmppZDI4bUR4QWRWNE9RQnZpYXNOTllP?=
 =?utf-8?B?NFZSYmdIeWwwcTRDSVIzdTNmbzRScUtiSHRFUkhCK1BncFo3cG1TZGs5YUFU?=
 =?utf-8?B?TGJBVEFBVVFvcnZvMkZObXBGUHN3clpFYVh0cnlXOW9kM1BIMkZ2NDczeVVz?=
 =?utf-8?B?NVlTN0lnNUsweksvWis2VG1rcmx3ZTVMK0pHRmQ0T0tCbUZ3T2p4dk1aSDM0?=
 =?utf-8?B?TGVxOXJBcVhhNkhNR0RLU2VZQ0RYdjh0SWRuU3FSR0tKdHRvRXY5VWFFMktq?=
 =?utf-8?B?YThFZCtFa3hnTGNhOTU4NVRiQXJ5WGZXay80K1NoTVZaYnREVFFYTGEvNFNZ?=
 =?utf-8?B?MnFKK0d4MW5WY0ZRejB3QllhR0ZnR1g1THpoTlowWGZnY1VnRXNvd1ZQVE8r?=
 =?utf-8?B?ektmN2VJWlJMZHhxNlc1UjZQYitaRE14cUJtSEprWkljTmd2Q2ZpdlB1SEs2?=
 =?utf-8?B?MForZTBlajhSSjUwZWlPQit2Ujg0Z2IrL1ZESEdBS3FDM0NHTnFnTWhkR2Fu?=
 =?utf-8?B?WVl6NHVWQ3Nqd3VFL0pVZzdROFN4VmhPcXR2L0xhTm0vckduVFVYUWtpQ3U4?=
 =?utf-8?B?bklzd1FIc0U1UzNkY0ZSMnI2OHNBbklsek1uZEpodEppNG5HbWVuUUtwT0RC?=
 =?utf-8?B?bXlmZXhnanluSlhKT3J5YjRzL0loZDBCOG8rdEhyRmk3R3JEbk03dVE4VG43?=
 =?utf-8?B?TGt1WE9BZDVqWHVDdk9rQ2hRL2prTFg5Z0xMK1k3bUlTbitFcnZ2RlZieEtU?=
 =?utf-8?B?ZldjMS9vUE53QThBd3hmYkF5cHduLzJPODY3dXkvTHErVzNqOHpVZDMxMHdl?=
 =?utf-8?B?VHlUL04wS3pKSFVheURaRWtxZU5icXBiNHNsM0FEZmpTbXl5ODNDNUk3aUVz?=
 =?utf-8?B?THo2UDhKZEZtNFhubW9HeFJKZXpJNmx0VE8yRFNwL2VuaUJYbzJYcHFCRE5a?=
 =?utf-8?B?Mk11UzE2QjR3WStwUXdIak42QS84OWNHZmgyVEVPcUh3QmlZTjl1TlpNbndQ?=
 =?utf-8?B?VTBiMlAxblh6MTNMZ3YyOTc4SkNJdnY1WE1TRHl5cEV6aTJYYXFGaWZQRkFs?=
 =?utf-8?B?WTkxWTJJWVhqNWk5ODJzUndqanRzOS9JeHB1T2FaamswWmFRdUxBcnlZZlpj?=
 =?utf-8?B?eTN2Z2U2Nnh2Qlp3UmNiWmpMWnRWdGhhYmxFYkVvYVc5QUc2S3Vid1Q5Y0th?=
 =?utf-8?B?WFhsdFJ0S054eWxoRzkyMnBuQ0dJQ01wUThrRlVJRitLd0RhcENDQkZITFAy?=
 =?utf-8?B?UTVJclNiV0NKb3JnbVFLVnZZTVVOc0kyMFAyMWJzVVpWUVlGRzZvT1U2YXNq?=
 =?utf-8?B?bldsaE1aQitNLzhHdllpOG02Z2RvY3ZEWnB1OGx2YXV0dFBLSndEQ3dlZjZD?=
 =?utf-8?B?WWRpUzUwMkRuRDBkQmpQMlY1NzVScy80c3hDamNCdXlVQXRhQlQ1d00yWkIx?=
 =?utf-8?B?N2MwcWNBUEwxeU1hT0x2WmNpTVk4UElnVGV1SVk5cWQ2ZW5CVlZQT2dZeEJB?=
 =?utf-8?B?Ynkzdzg3V3Y0NlMxdS9MUlZRb1oxYVhWb0xSb0RjRXRwWVM1NDZTakpPUDdO?=
 =?utf-8?B?S2Z4TG1DL0t4ZkFLODhCaWlza1ZWa0ZycEtYMWFhckpMOXE3Q0Y3VHA1OExL?=
 =?utf-8?Q?OW3YHo?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AMBPR06MB10365.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UEJCaHR5MGtPQWxDUVRVVTRER0FQNmY0cit5eERQdG1VNFBuU2lQRHBFSnJ2?=
 =?utf-8?B?VTg4NmpFS29mSU5vWHljcWFtU1BtT04xdlVlaEtiTWxRS2ViaTZpait4RVV3?=
 =?utf-8?B?MU5YV1hpdW9jbDgrVW9zUG9OcCtpVWo3U0laQjlmSTZNNERiNzJtaUdKZDBy?=
 =?utf-8?B?dlc3Z0hVZmlDTSsyRFR1ZUVUKzdHRzdGaFRZWkdtMUxlV3YvK1dNMUpHS1Fk?=
 =?utf-8?B?UzFNS1puMEdVdkU2OVpOSVQvbHJRWnNvTkgyZERzOFBDWmY4NzdOZ1VqUHlN?=
 =?utf-8?B?QUx3amVTY1BQRGEzazdCMzkydlFGeGc4SHVMbnNtZnBWcC8zZXlvN1FYRmQy?=
 =?utf-8?B?L25PUUMrQVNSbnZXSVA5TzQ1dVVJcWdkcWZCbjNIcWRhK2w5dTZaUERBYm15?=
 =?utf-8?B?YWJTU2xVblVBVW1UZVQ2SURKRnF5VFc0OWxJNTdHSjdlaG9kdHFoVXFwclZi?=
 =?utf-8?B?K0Z0N0luTXZ5bElJWXpnUVlJNUZkWmxLaUNQTjNvKzFXaE5NckkvRDE2KzBB?=
 =?utf-8?B?YWFWSFNmNk4wK0NvYnNMUGJ3WXpTdmhaWVY0NFB1ZmlSTUVpSmNkSmIralR6?=
 =?utf-8?B?SlMvcEdEUkNNS3hGZCtYZEVTTkU0UGxXSVpCZ2ZBb1dQVzkwSGNESFVoL2ZM?=
 =?utf-8?B?c1RiWStFSzVyVXY0cDFzenpvQVdkSzRRdGt2cHdaUHZoSVVJMTRpM3dkcGNl?=
 =?utf-8?B?L2VFVktEZnZYU3hpZ3pIaWJmdkg0V3hXcTBpcjI4VGNScnZlTENzK3JsK092?=
 =?utf-8?B?SG5LUzdOVVl1Z1NreGdFWWYzd2pyTm0wa0Nqc010QlRDMFdUbmtnbXJna3p4?=
 =?utf-8?B?VVZjVFNZUUh2UlY2UThIdGNLTmE1TDFkcHF4TVBuRjViZnBpSUNGWEpJMEVr?=
 =?utf-8?B?aGZiWDl5NGlwOEtBS05pVUQ1b3pLQVMxOXNQV3gzTmgzWlFaWnN4R1k0bnhp?=
 =?utf-8?B?WU80TzBwb0lzV1Z0NG84ZHBKcUY0b3ppRjE4b1N1cnluK0x2ZkEyK0thWlJE?=
 =?utf-8?B?RnFHNWQ4cnJnTE5yZTZTNmtEeG9Db2lQcDJMemtYODRFVTJ2Zzg3bXRiQVpj?=
 =?utf-8?B?TVVZYnpsR1k4dW5SdlpyNURDTHNMKzF5MlphUE0rYlh6Zm4reUltbDJxc29K?=
 =?utf-8?B?TU5GREJNTjJIRllFeHdya0dZa3krSldPTVdPcGNFd3ZDekZ2dVZKRmRsczJM?=
 =?utf-8?B?cFlDdlBhVzE4VDRncElFN2hWOW5sQ0NmU2hudkxCeWw1RGtScndlaXFnbDlP?=
 =?utf-8?B?cnVjanA1Y002ekd2S1ZYV2tkQTZGV0hpRTN1bDdlZHdadmgxOG5Jc2tsNHM5?=
 =?utf-8?B?TjRzdlJVbERpbTdsb2lvNnVlblVWUFVvN2dHTEZzRlNuSXExQU5oWXFDSHdG?=
 =?utf-8?B?Y1pRRUh4c3hhb2ZVeTRBeS94WlBaVU1DenYycHFrMWtZRmMrQTdSN3hCTjVn?=
 =?utf-8?B?Q2JwL2RMcnJKcmJoM1R4cHFsZUp3VmdrWmEvbmplUldpcDN6K2h3cVBhMFJk?=
 =?utf-8?B?OWNkbG40RkRYVTd6ZVFFSis3NDZUNkh4UE15S292MW8vVVQ5WTk0L0d4eTM2?=
 =?utf-8?B?NEtwWS9Ja3NRRCsxUThpWVBWcGdZcUlUWWk4YndxWXRvOFRlcCtaZ001ZDNo?=
 =?utf-8?B?dkx6RjQ5bVpoS3ZoVndjWXBoa3djSWVXcHNBME5JOVo5dFYrKy9keGV3ekFB?=
 =?utf-8?B?czc0aHc1T05nOUI1dlRMSkRKYngvbGx2d1FEa25zaFNOOWtoOTg1OXFUNFYz?=
 =?utf-8?B?R0dwRTh4ZHpYakR5Um9yY2ZuV21leXpNYUJicHoyMENiUGdEblVpcEY4R1Qz?=
 =?utf-8?B?YjJFZTVxMnIzbDhPSGZWVWZ4VnFVeDR0NGlTc2hPSnlhN25DNXg5QmFTMTFv?=
 =?utf-8?B?bUpWNCtOSzQwQ0xMZVJwOXJlR0FqSU9BVVNmR1cvRll5Z0RBYXVZbFVVaU9v?=
 =?utf-8?B?VTFadmh3SmhmRzZXVGs1U1luYmRVZGZGUi9JVW5wMzBqd3pxYTNRZHRHL2xx?=
 =?utf-8?B?cU56UXBtZWtTWFlERnF5Q1IzQkRRV2FNSmtlNE1vTTg0aHh0RHg4U2prUUpN?=
 =?utf-8?B?eDJ6cnlvY1Zib1A4dHlHMW9WaTZrUXpJVjZSQkJQSEVXYjVyendUNU5aOWNI?=
 =?utf-8?B?SXRLdzR0ZEFIUG1ibjM1L0V2VkdFTWhPelJValkzalRUc1ZCN1ZKUzVEaVZE?=
 =?utf-8?B?d2dxcmtwYUlMQWNPeENoejM2ZkRpUGtWdXdTcFBKWlJsTjFhd2lxTGVwMkx1?=
 =?utf-8?B?emMvb3c1SDJLMlFrTnZHd0s3enJjakU2a2Y3OUwxZzVHeG0vd29jVThsT2Nz?=
 =?utf-8?B?ajBkRWt4YzN5SkhMQjVoRFRpdW1UVm5zUFU4NEtISFhNMGlaOGFZMDNzdnJV?=
 =?utf-8?Q?VsO8i8FSDooIVv4E=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc517884-ff44-476d-ada1-08de4eb4a3ed
X-MS-Exchange-CrossTenant-AuthSource: AMBPR06MB10365.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 12:51:28.5207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c9PkvOsgqLwcU62Z4YgqI3e5Sw5Qa1uID1wV4PPwtQ49XUX3EDOAD01tIuSKZLRcgFOkuO6v2vLwRYRZyUsltQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB7456

set_offset was using remainder of do_div as tick_mult which resulted in
wrong offset. Calibration value also assumed builtin calibration default.
Update fract_offset to correctly calculate the value for
negative offset and replace the for loop with division.

Signed-off-by: Tomas Melin <tomas.melin@vaisala.com>
---
 drivers/rtc/rtc-zynqmp.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/drivers/rtc/rtc-zynqmp.c b/drivers/rtc/rtc-zynqmp.c
index 6740c3aed1897d4b50a02c4823a746d9c2ae2655..d15c256e7ae56058ddc38849af6424cd29b8965e 100644
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
 	unsigned int calibval;
-	short int  max_tick;
-	int fract_offset;
+	int fract_data = 0;
+	int freq = xrtcdev->freq;
 
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


