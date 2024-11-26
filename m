Return-Path: <linux-rtc+bounces-2631-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E2B9D96AC
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 12:54:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5B2A4B2A12D
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 11:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B7BB1D362B;
	Tue, 26 Nov 2024 11:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="oJTnyl+I"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2071.outbound.protection.outlook.com [40.107.241.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E0D1BCA07;
	Tue, 26 Nov 2024 11:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732621807; cv=fail; b=RTCOh1rjxacszWXDNuj5FZ5VwjGE8zpRTWEeLRTlXo8aua0+e3A2lr3ZtEyQk+X2GBXOqsWOxuH4ZmWcjGycKQfnwr62suSIDKlm2fCQ8KdRTo8mkPLTDRb1Cn8lZmBzjwvi5EEIbBK2uMCgdVheCwSW4Lh1moF6TCIyza5XXn4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732621807; c=relaxed/simple;
	bh=2Ti9IA4q8+V6XEthcD+R/VQdUVoYnfSq6C++L4lt5Ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=E4hKchLGw4oKIK27HKiK82KVa5f0hK6vk7tayJMsvmzcMor05alxWa+EJDHzZCA8bUfny7SFf2KieMUZr3gqwioYsSnGmf0eTBriJFmiYaygKFUZoVmGwi4Afluy5FbMhRDhQ8oL4JcXxKmE8ZxrFyL/O/lPWe7y4rZYa9wY9eE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=oJTnyl+I; arc=fail smtp.client-ip=40.107.241.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKj8qA39R6mtgOUcN30dJQA+CWF3G8mD/NfdSvfh/iQEFg647EtepY3ckP3NSKFVpnPGIifjE5ypPaqo8J7FnHbCgd7MPKsmE1JZBB2FU84lFfFr9mrPoriTcE7osV3hUGC58H9AnzH6tqEb77zYlAhauRl2QZ3k61+lfeJl2OIZ93Z2TFMyi3xY1pWzX17TO1YBdrmnqvl+pmM1M8RzZ7mIMOYTDGmSbzhlMiU4jeLkVsNdNCmzQExvtcVE+2qSwEnSNdz9et0B7hBcWVvfs6PvzQqt3SWr3CEitWM0uCLOegzMQWIOhnv1tuCcebcW6WQ0nvE+QDuBVvWH9uLx2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IpcKct8OJzusN1EL82Y/RppxVKKKSW/aLqK+JUEnURs=;
 b=BgWADA0R19EMjyM1ponIF+CeUnUHwVXf9avlqRaZOkxKTYyklCFzYGcTm0JXmPH5YPd1VxqU9g0q9170++9O50MA+gacYRHafg2dxyHgQiCHxJCcFj7ZG/wEm+8OUREBSaFxW2jGyk5S+OW/pDi9LyI3pZF6AgXXdYNH8AlBj7kNTNrfYkdQ++VN1ODqqPV+qUONazhcCLib1Pbuy9mG7KDfIhu5h/4qDQUrkb4193C4ulCLVunbYGmI4jtL4gc4TNQebH+ohAnzLI8JxVQRZp8IvRvO9bBF5QS1XJ5P+OUqt1DO39+3GKKiUjiEXvade71Du1eT+h+oLj0901qnwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IpcKct8OJzusN1EL82Y/RppxVKKKSW/aLqK+JUEnURs=;
 b=oJTnyl+IzuIzGf1T8SGWONAaZ4i/A9VEkpt18mrAyS3roIziWEC4nLDVz3ysK1qG7ez0UjExaL0vhkzy3M0kW8waNwh7zUMOPbWcCI68AjbORF+ecXwWxeG4A0rvD11vtCjSMcogDGBSWEUc3RU2o0o435NDEdl/m3sg5uFbr/29Mu1GThgeXbmUa56k8QlGA4+YbcZTVXPY5XOctjy5jrjODTDtZe3C4eQdLHzVaOkSjiJL3OrSqSXYwQPqrAe04CfcYs+WLKAQ/p52kNGiYgFC7or93W86BdQBKc5l3uX9fCZM4+qTv2UFg7DVsXLRCEbeE0vF1VjVmL04OZbJjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PA1PR04MB10294.eurprd04.prod.outlook.com (2603:10a6:102:44d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 11:50:00 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 11:50:00 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	NXP S32 Linux <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
Subject: [PATCH v5 3/4] arm64: defconfig: add S32G RTC module support
Date: Tue, 26 Nov 2024 13:49:39 +0200
Message-ID: <20241126114940.421143-4-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126114940.421143-1-ciprianmarian.costea@oss.nxp.com>
References: <20241126114940.421143-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BEXP281CA0007.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::17)
 To DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|PA1PR04MB10294:EE_
X-MS-Office365-Filtering-Correlation-Id: d8ea88d5-8e25-4c20-d044-08dd0e1074e5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TksydDk0QUNUNFdydmN2d0l0VWlYaHhGMXlvd2RiRm0ySHl4L2htbjBDR3ly?=
 =?utf-8?B?b1h0MU9iN2c5My92TGExOFhtNFp3RmVPNU5CbmVWM2xqaDFwZVh2TXZRTTdh?=
 =?utf-8?B?dTJSdWhzQUlla04yL3RzcFJtdnVOY3V4QmZjTmRTN09RZGw1REM4K2JIa1RP?=
 =?utf-8?B?R3FPWnhIY2M5ZlV6RDNBNEhFQS95WkoyZlZGRWE3Q2ltcHdGQmNtNGFPUXcx?=
 =?utf-8?B?aUY3RXhGcXFsc0FCOWVmcDgzQllGdlhkaDM4Rk9iRG5RZWFqTjI0MmhpZlI4?=
 =?utf-8?B?YjVRQWJhSTJDV2djQjE1aTRkMGkyRjBGa291RVRQK3FrYmNjTHU4NjBHclE3?=
 =?utf-8?B?WUF4QVJHcnhVQXVYdkJjNHo1UGlwVmxNeE81U0dwWEc5aDJjbjlyRnhJSEFE?=
 =?utf-8?B?VTdvRnpJMWI2T01PcGI3TWQ4ODFSUWZ4YXFJLzNpeWxEY1lYbUxxOTcwN2Rh?=
 =?utf-8?B?TktXMXkyMHhtOEN5MVQySVdEbE9OSk93VTlBM0ZmcFNwcTRJODFSZlFHVC9V?=
 =?utf-8?B?dzVhSXd4VUoxTXJsdWFvNGNJR0R6ellWZlhrK1V2TnZheUFQUHR2eXRkZXhs?=
 =?utf-8?B?K3k1R3MyRDBmNXFVZDFNekk0QXdTaUY3S3BOcGI0emVWc0c3M1h4d29jemxo?=
 =?utf-8?B?WU15RWR2NkpRMU8wU2pZZ1paaC9Vb01nTFY3V2VaeldiNHJsNWxRSFp4a1JJ?=
 =?utf-8?B?Z1FNZi9yOE00MGUyWjJTaGZzNk1jQTVSb0FVSVdla3dZWkl2WEc3LzhtZTdk?=
 =?utf-8?B?TWNlQ2JKWHpYYVNFYUN4ZHc0NnpQTjQ2c3VpRGhKOUZHdXFCS1lKdTNlN0Vx?=
 =?utf-8?B?eGNHVnNUTnhEUFk1MFduRW9ST1lURHZkdDBJMHpEVWFxbFNWMHdZUEMxMW9T?=
 =?utf-8?B?bmw1TlE2blV5eCs2aG9XVU9TTUVhNTljdVFNbmh0YnRCT0NWbXNiZHN1RFlv?=
 =?utf-8?B?STBWbjdqMlptVm12enpoMlVrZ1NINWtoNXFkb1U4c1VEWUNzdHNzV3lCODVl?=
 =?utf-8?B?OG1XZVVqU08xUGVJT2tqZ0tiTnBGVFg0MW9GNnVzZDNQNml3blI5RWQ1YUp0?=
 =?utf-8?B?eTFKa2V3SjRuclBPNVN2bGJKb0JXRFROVCtlWGZrc2JEMmxqcVRBZDUyd1Jo?=
 =?utf-8?B?WUE4bzBHU3JNeHhiZ2dhVmIwVHB5TVA1Yk9HV2dUTkVWcHN4aEN6d2xVckRi?=
 =?utf-8?B?aFdIMlA5VlhIN0ZjdkczWjdPaWJudjdCdVFUcHVIYzBETDdIZ0JGd0t3TGR0?=
 =?utf-8?B?bWtPVndzUE1RNXJlelU5S1BiS3lwK3VCTWhJYUN4ZGlob0ZmbC9ZWXJsdi9s?=
 =?utf-8?B?T2ovTG5yRWhzY2J0U28wMDBrVFNQYVNVTUNWNXRUVmtIdnM2QnN2NXkyVzJB?=
 =?utf-8?B?QmRRUGlRVzVTdDcreGN1QU54QmdTblZKU1pveHcxVTA5bTE0dEpEcXZjNVdQ?=
 =?utf-8?B?SVZxdC9tMmNyZDFQMy8zem1xSGxFbi9pT0dDUmdXOTV6dnV1bVZlS3pEOFVG?=
 =?utf-8?B?aEgwa0Y5SFgvUDFIa0xxcVptVU1NRmtIS2hxcDlWWkIrTVB6T21IbE5Ta09s?=
 =?utf-8?B?c1J5eUY0NE4xRzBUZUYrbDR6WUZ2MWNTREQzVEFGZDlpV2V0K1o0dDZEQ0s4?=
 =?utf-8?B?M08rWVRNWE1wSytSNzJOdXN3UDhUeUxDQ2JyenZyWUVVRktxWGk0TEhkZERU?=
 =?utf-8?B?QzFxTUFwTTBJUUNSUzVjOFhiM1J0cnNyMUF4NTJGTTRydlFTdzEwNnBKbzNW?=
 =?utf-8?B?TkRKZ3FqNmlQMDdWaU9TS3RYZWdLOFk2WkRPT0E2Q2Z3YVBJODVndG9JNVVo?=
 =?utf-8?B?Ykg3MGdJUkg2ZjJ1UlkwQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NEUrS040WEFHWE9nN1FENXpYaEFaVzZHNmRxRVBIV2FQM2dFR3FYN1JzV2Fj?=
 =?utf-8?B?MlFLTDE0NDZnWFltLzkwSmswOFQ0NCsxZnZDbEFFNHpNM1JrcmpPQ3ZHWi9z?=
 =?utf-8?B?MmlqdlJSVkpXTElKZnBxaEEwczF1eGdvVEhrQ09FV0hiajAwQ3hoN0d0Y3B5?=
 =?utf-8?B?YVVleUVkRGQvc25oeHFEek1tMVgwN0lXNm03Z2lvV0V2VUs3RXNoTmEwSXF3?=
 =?utf-8?B?ODJSYUdXWlR3dGI1c2R0N2pBcjJzU1llc3RGTjJwKzhjTGZ2NVFDVzgwZzVE?=
 =?utf-8?B?U1RIMWZHTkxTUGRHVFZweUoxTEJtaGxPaU9mTktmYjhkeUdBclZhTXdLR3lr?=
 =?utf-8?B?Z3g4enN4ZS81RmRGb0hEbU9FdGVrcGUyOEJiVjBTZStsWHNGaTVsM3ZKMG8w?=
 =?utf-8?B?cFpqbFVLVWg4ZmEyNngzNVBLU2g4bUY3NE13NndJS21wcWVpb0lwS0lDTWxr?=
 =?utf-8?B?MGpvL2MwTnhsaC9kY1REb3NwVXhCb2NLSWgvVVExVTNWV3dtekRqTmh1Znd3?=
 =?utf-8?B?VGR0MmhzbHFob2JGWWIzVmtpcEc3NlUzdlR2MVZrVFk4SEd6T2pXU3hCYThQ?=
 =?utf-8?B?N3AvMG01d3Jla0VHcktlR0tyQ0VjZTlUWkNzd3hIdjdoSEZsTFJXWi8wcCtx?=
 =?utf-8?B?SDMyVDBJWTduS1UrOFlGL1pJU05WTEt2TURLbTlSVXAzd0x0OGZxVzdITDNx?=
 =?utf-8?B?TUZpRVpIcmprYjgwRC8xczVwVmpBTWxYNFUvV3ZEdkZlWFVjQmlyQ3FsOWlK?=
 =?utf-8?B?eHY2VDQ0SktTNXNxNDdOQldwN1JPVHpuQVhhcFdqWThyQ3pZcWorMUpBQmlu?=
 =?utf-8?B?TGdhcElIYXpvWjJiWkhXUnNidXNzRFdlQ1M5b2FOS1g1dndMelo3bjFmNVlM?=
 =?utf-8?B?S0RSdXdjcUZsMXpSZDNzRzI4WXl6MDJqSzBsMC9iREpxbDdZd1BCU0tleTVN?=
 =?utf-8?B?b0xFTUdBNW13SFdidzdGTUVWNDBiMmdSUGhaNlBpWkRBdEYyODhHU2FUTnMz?=
 =?utf-8?B?U3JSS2M3NTBCTmhXYk03UlpLVnBOUEkwbjM1aDNqWG9xS3lCNXpDb2NsalFE?=
 =?utf-8?B?Zk95Q3FWTHdrcjZabWwyNFVUN2dhdG5IUENWZkpuZjJ0RDB4RW41TnMzMU83?=
 =?utf-8?B?azlaOTY4M29yZU5QSllneCtWS3AzUUtRdEZ0aFYwU1NHeEZRaXEvMmZWMjY3?=
 =?utf-8?B?VjMrSmcvVDR3VXpIMGQvSWNqUytERDA2bXlwWnhiV0J1VWRMUlEwYlR3alR4?=
 =?utf-8?B?RlBqaVBETWdHTTgyV2tUMGdhNWxiaUdSRTlBa21IbHhLb0RYdlNWU1JrQ2ZC?=
 =?utf-8?B?aEJ3WWZabDhXamN0djRQaHJlSEtwalRFTDlYaHhMMkZQdkxRd1htaWp1TnE1?=
 =?utf-8?B?WEMxSFZ4cWtGVE9VTFNrVXhCUHV5VlRra3A4bTdRd0IrL1NzUEY1WlNLZlA5?=
 =?utf-8?B?clpSdG1DRGxpK1JDTjFLZmVua1NHdkZZc0RGSk5FV2FWRi9mejM3WTJ5VytK?=
 =?utf-8?B?cVRKUW84YnZ0TGdRNnZDSkpxdHVYU2NqWWhWeDVHdDVMcXJpYkdrWkgvRW5n?=
 =?utf-8?B?cjd4VzNjRE1mMjNOK0hQQ1lOWFd6aDgwaFVBV25XWU1UczhwdVhnclk5cnJT?=
 =?utf-8?B?VHl3cTlNcVJHbVVWU1p6R1dPckJmcmN0MEhLYkZTOGprczdDVThNV0lpblVE?=
 =?utf-8?B?S3czM0lNQUUwYnNrWU1iZXZJemE5WCt1cHpITHFMWkhZM29IL1RybkNKVHhH?=
 =?utf-8?B?L2RJUDh4N3E4SEJpOS90ZUhYekpoZHE3NnFQNktLTUNDTGZ5ZlB6Q2NWbEJ2?=
 =?utf-8?B?WWZYakVnOGFWbnlmeXhNWTUrVzYzcmZKbVJKOTV2U1p0SkttL3dMRm9iMUxW?=
 =?utf-8?B?UWI2U2tBQitXLzlVeStQTWw5OEpwUHZOYWJWNFZ3K2JoK3JHckpDcllsL0NQ?=
 =?utf-8?B?SlFmL0h0L0ozVC8rNlZEUnorVVVwODZmd0lRSjYzZ2l0QWdvMFl0cGh5aWdB?=
 =?utf-8?B?b09RNWFnKzFNUDZGcFhIV0N4ZFY1dWtVUWQzR01haWVJMC80UEx1QmNleWF6?=
 =?utf-8?B?d3JPQkd1a0h4YXRDTjNoRFNxMEJkYS9wUmFiV0k1L2cyV1p6NlYzOFRDSVR2?=
 =?utf-8?B?N0ZpNFBla09jNk9naVpxTVZvSVlzYUd5dEhWVmZqNERGZkkyMHFtZW82eXE2?=
 =?utf-8?B?eGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8ea88d5-8e25-4c20-d044-08dd0e1074e5
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 11:50:00.1648
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qjoHS5xSKubXsGlezRxG6RYJmiFisk7qDv6YLHyeus1tP/lriHhlKWcVMAGFVoQaQ81wYxephwW85Es8F95Kf6JqevWhY8KKX3mve4QXMO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10294

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

The RTC hardware module present on S32G based SoCs tracks clock time
during system suspend and it is used as a wakeup source on S32G2/S32G3
architecture.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5fdbfea7a5b2..584cef78c984 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1209,6 +1209,7 @@ CONFIG_RTC_DRV_DA9063=m
 CONFIG_RTC_DRV_EFI=y
 CONFIG_RTC_DRV_CROS_EC=y
 CONFIG_RTC_DRV_FSL_FTM_ALARM=m
+CONFIG_RTC_DRV_S32G=m
 CONFIG_RTC_DRV_S3C=y
 CONFIG_RTC_DRV_PL031=y
 CONFIG_RTC_DRV_SUN6I=y
-- 
2.45.2


