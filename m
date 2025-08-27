Return-Path: <linux-rtc+bounces-4780-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A904BB38A3A
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 21:34:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 818BE7A631D
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Aug 2025 19:32:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F382EAD14;
	Wed, 27 Aug 2025 19:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="gW05HdcD"
X-Original-To: linux-rtc@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16352D9786;
	Wed, 27 Aug 2025 19:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756323256; cv=fail; b=Vq6aRSgMWoeJ8o6+s/+MwouMG2obH7dv3FKhQ8MHR4LTrSMdkdAE9sIoL9CXgMRWZMylHUP4puGcmPqisHDxyIHEjbp5OIqEGqK9Imp4eggf7uiC137Vnkj5/0woS4rLcZYduqEZbDeG6foG7OIfrEmxjx9igR+0uLMgv4eg6nk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756323256; c=relaxed/simple;
	bh=7nKo2wQ2dsCKcBH26vQIozNMdQ9SGVqZH/39AqCyyT4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=AbwPEn2hNMXVfSvO9T3kG7LsWKp2f5zEDDfBqaaxXn+0bLnO6wfikyheVYmuZxUvwC5rHyVjL3wn0kY2A1JKOD9rDJ53ltL1RXqtpCmlJIS5YCJEK628Lwi7+K/d+o/XW+qWrH0Z1dG4rrPUkPwYDKtLWiAF4knT/GIwPRAFcss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=gW05HdcD; arc=fail smtp.client-ip=52.101.65.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l65KMsQTA7hvH7kU0vdL0C/aXoZ28xZ6XEcQKll/4K+vZ+AVee/52cRi0ddh6v36zW3j4oDptwuu/o5Kxy36CYJ4DfFRdXfYFtk+c6QnvNEOa3e3dmnlaADtSoI9tmAdihXEKoQxUCh+UjF4WOCP8KqyaoMUW/pHWdvom+II7zmh+5qm2niighNADBzN6Dgqa6dg2o7Zk7jIgtK+NSkncXuOSxIxwH1AAEA8tMeNtbTq6khZB8Zq3rOYXDfvHNralDwjlKyqtjTDjBt+sb9oF4y7Opw8ik39NAt8wdXdnut7j/Ek9WZSaqMeOyP/O86yiSnidh8p66zwbKZ8D+j88w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xXRZdCR6E4o4UKBmaN2AvvbHj4zQL8dtO+1G/LrTH2s=;
 b=qBgjZGaaZryiPq+l99PnBllmc+GxNCC/gZZokrkPJMvy7bR2E5QF6tWt/zPbyArjLdayvrEPo7H3hA+ggha5udIBkRLmJhrlLmZipu6LZgQib53GRthN38HIGFpSu4pW/tyMV3zuT0SIPyQJ9agVj9MIqzhP1ua8lZa/H897LMFpp6ip3RrgPR9/LfYUP41rUwoDEMpvyZK3astbora50oPmBbPugxBTE435d9gDfGgcF9pKKFS29hCKYWzVgPntn6UYbJpQaG4XIKqb3EZo9bJCUeonl1NIknDWBEzGeIMpuAn7j0Woj+97oTWRiiURXqZsbQ3TtLRswmqAF0PLtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xXRZdCR6E4o4UKBmaN2AvvbHj4zQL8dtO+1G/LrTH2s=;
 b=gW05HdcDmY8Og0Nf2AK8qCCHs4R6pHINEWhLhbqYZ6E5/W6wpOuoQHa4sdAV3BWRkTiG70trMZDRXdK4xpuOfhL7rEF8Wi/rRhd2IQGsv1j0YNHXu+uyt+wezFDCbwOWR1BEEf7tWaIsomNv9UkbBU3i+Eryg1cAi2gOf9iNcPd7Sh83/BBlkohtnecAYlyg/OhTJDRYDffi7KVxfwx8rVMmd2y5ijJ85wejDbEPiJRdfzuIeOmXupzmyPFSrHAeicFbuGazsXpXHz70z8iAtBk5fU0a0biouaJPzpZg9ja8mrU9KMc9vpz2I/hYOeVSBaxWp7v9wVQD3XkaDzDftA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com (2603:10a6:10:309::18)
 by VI1PR04MB9881.eurprd04.prod.outlook.com (2603:10a6:800:1e1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.11; Wed, 27 Aug
 2025 19:34:08 +0000
Received: from DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d]) by DB9PR04MB9626.eurprd04.prod.outlook.com
 ([fe80::e81:b393:ebc5:bc3d%5]) with mapi id 15.20.9073.009; Wed, 27 Aug 2025
 19:34:08 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH 1/1] dt-bindings: rtc: trivial-rtc: add dallas,m41t00
Date: Wed, 27 Aug 2025 15:33:55 -0400
Message-Id: <20250827193356.78368-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0017.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::22) To DB9PR04MB9626.eurprd04.prod.outlook.com
 (2603:10a6:10:309::18)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9626:EE_|VI1PR04MB9881:EE_
X-MS-Office365-Filtering-Correlation-Id: b6b32ac0-44e3-44ca-03fc-08dde5a0b0cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R2ZONktaQjVOOVpuWGt4ODMzNE1GR1dWY0VuOWFWRmpVUTQwSkE0czdwa2di?=
 =?utf-8?B?ZEI5MndReUkzNnpLVlo1WlVHMkR3RUlEcGRFWnFzVEJuSU9TclEzSkRtbnpQ?=
 =?utf-8?B?UkJGNFhYallzekM4RHJsVzI2bG9sa3BQTmFRTFVUR3NRU1dBTTNPclFGOEFx?=
 =?utf-8?B?S3BobEJTWThKZ2h4K3FlWUZBWCtvYzhJNERES3hFSXVmTlpZbFYrR1ZGN3JN?=
 =?utf-8?B?YllqNXRtdHFaV0t3UDRjaTlYSklyQ2pHUVhpYjNwY2ZhTHRNMUpSdWJ4WVI0?=
 =?utf-8?B?cUF4aG1NdXRoVHZMaUVSV0NjVG1LSytkWU84aWJXM0Nnb0Q5Mit3eHZiaFNL?=
 =?utf-8?B?eFRZTklvVkZReXBZVXlMeE8vVkw1MEd5VEdEWUlTWmZRWmU0bjZ0b1RreWRi?=
 =?utf-8?B?UTZyakVFdXE5bjI0Vjg4TEs1Tno2cEMrS3FVc0llcEhHWlE4QTA4S1BveTI2?=
 =?utf-8?B?NmQ1ZjZwc05YK2tDdTFiN09lN2huVENIQUcyWXR6RGFQWitkZ0xyV0VqcnlK?=
 =?utf-8?B?aHo5NG1IeG5OYTRxcDlIU1NXdHBiNGVPd2szOG9LcE80c0hUMlVwS0xQSUxM?=
 =?utf-8?B?ckdHZnpwcTQ0dkt3RVdtT0g5d0xQRWhjNDlLT3paZTEwTHlaenB3WlZjQU5n?=
 =?utf-8?B?SHFVZGJUeGFqakV2M2hPNEQzTWhKQVBnTzh6c3dybitWYmZnZ3lHMmNhMFgx?=
 =?utf-8?B?ZjJpVXhuNDJNNmpjT1BuSHhyYVdSRkNmdjdHTnY0cTROWXNkRXhZcjExd2lL?=
 =?utf-8?B?d0J3YWU0akVOZDhVUmJxb0FCSDUwa05SMC9SOWlFeExDVm9SUGI2N1UrT2VV?=
 =?utf-8?B?ZVRkaHZPZmNNb1BneWFsWWdONzNQcjJXZmdmVm82OHd5OXRyalpUc3dSWlYx?=
 =?utf-8?B?M0RoQXNBMFpmbzVlajZncXRPNERoZ2hub1laTzVNZFU4L2N1bHBBeDdLd1lv?=
 =?utf-8?B?SWQ4cTJWT2wvZCtCQllnTFIwdHRocS9qYVY4Z2k4cnF2bXRiRE9CTm1hUDg5?=
 =?utf-8?B?VlRBeGVnVHBEODhyRGN2RjlaZmU4M21BWmN4SHhFc0Rpam9HOWFLUy9mR2g5?=
 =?utf-8?B?Z3J0S21JQUZvQnorVEVEeDR2ek44dG1TYVg1TXhqRHBialFhQ1NNTk9CODRQ?=
 =?utf-8?B?Y2Q1RHB3L3llTkIvbEFWSUhGb1h1ZWJtVVJ1YzJyRW42NnlwRmp2eGQ5QTJx?=
 =?utf-8?B?VFNNeWwvZHJKM2tPNjhZYXhzbjBZbnFmNFcwUnF4d293Y04vcFFBck1SRncx?=
 =?utf-8?B?RVZWcTc3ek5sem1oZVppYktZUHA3OHREQVdXRFBzQ0MwbFRzUzR4eWFrbE5M?=
 =?utf-8?B?eVlvRmwxdHBGbnN1ZjJBVkh4ZWd1clVHdmRtQ0ozOGZyZjlFYWNLaFZsaWJj?=
 =?utf-8?B?UDdkaWI3dVVvaUZCZERhNmJZSkdob2p2ZWx0QjQ4Q2hwcUp6bEU1bU9NT25E?=
 =?utf-8?B?Q3RKemtIYzRZK0N5dFJUaHZ4aTRjckFZQ0ZSMVYrMzBRM3RBVWZZZWFlZGYw?=
 =?utf-8?B?MmVxL3V5SFRWSUtyajg2OFh4UXQ0V0cvVTJsaStmbUFmNmRoYThPTHNwYlEy?=
 =?utf-8?B?dys4NzVRL3BxR1lURGlQeUJMKy9RNm5OV0ZqcVdRU0NmamhERGJMYmQvcmM3?=
 =?utf-8?B?alhKSHBOSTFjT0hiRXZwWS9qUWZFaDJYbloxamxsSWNvVDJwTld0Qm43Z0Jx?=
 =?utf-8?B?TUZjYXpROU9jaVVMdFhMOXBnM09LaVhkdDA2NCtMTGJ3cmNFclUzaUtsbEFj?=
 =?utf-8?B?aDE5QzE5MzJjZEJZcFYyeGZQdXhsSDkzQXl4c1YwTS9peFNwQ3MyYjArb1Jr?=
 =?utf-8?B?emNiZ0R6a0RLU0xZTnA1R3kwMDhBM2N4SzE0YXBXNnRvNW0vWUkwQ29uNDdL?=
 =?utf-8?B?bTIzSDRYMUp4SDVkOWNHSFZTb0w4c1VYUmV1MnNHSE9vNHMxWXI1bHZvOXBr?=
 =?utf-8?B?dnZ4UnAzbENNZUJZRzd0OGF1NE5iQkwvNHlWSlJmdi9aMUV2SUFqaVY3Rzd2?=
 =?utf-8?B?T2pEWmFCYy9RPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9626.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TEcyVHBQT1RWUGhVaWd5OXpoeFd5TnpnaGVYSjlEbUNlY09iSk4xSGVuS3Er?=
 =?utf-8?B?bW5XUkszdGdZbC9TamFEeUw4cDNwOUVSQzFBOGxSQnZKd0NqZFErdjRpY29C?=
 =?utf-8?B?WU1vRUFzRmEzSHRTVm54aTBaQXRwcjhBMXJRdGdwcVdUWlZVTmNVa2EzdGU5?=
 =?utf-8?B?UEEzak9ZNmFnSVRQcW85UnRRL25GamxNbnhza2FsSFgvNWRWcE1MMVhURzJI?=
 =?utf-8?B?UjF2anUxRVJ1bjJvaFUzTGtKVGFwMEVuZjY0cWV2ZHczYVlHMmtxa0Foa3lG?=
 =?utf-8?B?L3dERWIxcTZ3VWJCbFF5VXp1S28ydCtsTUF5aGNSdVFqd0hVRVU0WkVaOTZV?=
 =?utf-8?B?UmY5eDVmNVNuTmFQZDNDR00zV2dPMGQxcXMzeVFpRi9PdDBCdVlsSWV1SnFa?=
 =?utf-8?B?RGl3LzlEdlJnWW1UK013VU00KzJreTlDMmVkYkJyTldSVUhtK3l5Uk1uRVBJ?=
 =?utf-8?B?eGFSRWRKQytDVkwwWko4L3JLSmgvNW9qbFRkZkQ0Vlc0c0VJelpqVXU0OUtE?=
 =?utf-8?B?M1EzRWhvek1lRVBMWkkvbEdNcnp6aS81WlI4T3NuZldQQkgvUmJiOXF5UWVo?=
 =?utf-8?B?SEg1cThHSmsvcVlnK2ZtSUVlSDRINmQrME5rREZZUnBNRUQ4NDNidVg2RSs3?=
 =?utf-8?B?ai9JdXlWRW5rQk5qR2ROKzdvWENOL2pPRWs4OXBLS0R5SjQ5a1RXWDZCL3Rv?=
 =?utf-8?B?UU1jcTMxODBxZnhUUmppcGUvQXFDUnZPd3VWYWJlZG9xSU9aUXRmaDZBMTY3?=
 =?utf-8?B?OE82Rnp3TWRoVU5FdXJ5NXg0T3N4UmQrTld2WE94L1BFQVFkUnBYM3F2TEpn?=
 =?utf-8?B?NGRpZzFOY2dSS1VKUWR0WXAzaFlYSHdVNmZ4UE0vWldiTngzdktoM2JPWTd3?=
 =?utf-8?B?RDUvTi9qcElSOGljVkRrZVZrNzlnelBoY1FxdjA5U2lJMzBDanBOU0hLVEZi?=
 =?utf-8?B?YlJQdFVyVThNOC9UcEM4RDNWd2pzelg5OCtEYWcrc05DUTFOV1dncVFhYzll?=
 =?utf-8?B?OHByNVlFd3VKQU5mazB4dnJXNlNLSERGSmlnbks1b2FUWEQyTDk3aVJKLytV?=
 =?utf-8?B?bmlIWkRHbURqampjUGxjYk80RlRDekdkNU5MYkl3R1NQWHFITDdrOWZlK0gv?=
 =?utf-8?B?VXpDTVNmNWhJWm15SzdsWWNKZHlsMGFYd0hMOXAvWVFOUERYK21lY1VPV2pu?=
 =?utf-8?B?Yk5uNXl3aVFVWm1DUU5UblptV1VrcVl3UHkwZ1hTQW85ZzZFRTFnS2o3ZElY?=
 =?utf-8?B?VXd2UFc4RVlFTmRpT0JDSGRHcDZIU1piYmk1dlN5UmkramNmY0lmMmU2Z1pV?=
 =?utf-8?B?SmQ3UGF3SkNhcWZaUndQeVUyK0QwU1duWUdldVpBc3BSMm9SNm9JdS9XdDBl?=
 =?utf-8?B?aDNPQ0RmQ1FBRk1CR0hsZUNIdkJ6L0lycTJYOFg1NDJtcUtuSys1ZzZlTVp2?=
 =?utf-8?B?cktyc3NLd3B0YjJocDVVWndiTTJTTE54elZkT0dQdUpLYTA4TFpWSXh0NmxB?=
 =?utf-8?B?WCthZHVLaVAvOFRFUnZ2OThsY1A2cXBLTmRVM1Q3N1RKOW14ZUtMTXR1c2dY?=
 =?utf-8?B?Y00zaTBGVmFnQklMMC9FV01JWjljR0ZGclpDUnVEb2pwOVlOMW1pS1hzWkVU?=
 =?utf-8?B?SFk0YVRvbGNaK20xTGNId2ZsN1pUQWd0ODdISWdMU3JoMWV2MDJ5anQ4bzBq?=
 =?utf-8?B?aHAvT0dnaG1tVkszbmFtUk05TkFIRWVrWTh0blkrY3llalJCdC9LY2dub1d3?=
 =?utf-8?B?emdwTFg5enZHUGQ3K290RmRzVVZNN0dzSWdYL0hsQlB3VzZWUm1CUDl5b0ZX?=
 =?utf-8?B?Nkk3aDJNSjI1N0N1RUs0alZ4Y1ZEVytDRVBoZXA0V0RzNmdmUis1anpZaDFM?=
 =?utf-8?B?R05wdUMyZVJhdjhpQThsbE5FRjN6NFN5SXN1ck9OdVVGOVVNWGp0cVNUK3l3?=
 =?utf-8?B?Z0JqRS9iZ0M4czdZMzVrSHFqTmYwSXNFa3gwZCtkdXhzYVBMQjFGVi9Ea0RC?=
 =?utf-8?B?alVESGFVWnVUYnFRRCtSWnp4M3lQV3luNGhoOFRzQ0xhK285Z3Fob1pzY1Jv?=
 =?utf-8?B?SWdpdW9aWmlSdS9OUGJ3RGhuSVE4QWd1cFp4U3FjZVJ4TXFqL3ZpbTMwa0pK?=
 =?utf-8?Q?e2R2qQ8N4BcT6pl7wdurSH6M3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6b32ac0-44e3-44ca-03fc-08dde5a0b0cb
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9626.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 19:34:08.3928
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 06qv9oOM3zKRmPE7KfIAl4cq1TzvSeSa/KQzp9KFxTx8QoAXisoMbcZ5zJzAWcF5nfHqz+SmdpmcQqd8Vsw1fQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9881

Add compatible string dallas,m41t00 for dallas m41t00 RTC.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/rtc/trivial-rtc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
index 5e0c7cd25cc68..587b7cd5806c1 100644
--- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
+++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
@@ -38,6 +38,8 @@ properties:
       - dallas,ds1672
       # Extremely Accurate I²C RTC with Integrated Crystal and SRAM
       - dallas,ds3232
+      # Dallas m41t00 Real-time Clock
+      - dallas,m41t00
       # SD2405AL Real-Time Clock
       - dfrobot,sd2405al
       # EM Microelectronic EM3027 RTC
-- 
2.34.1


