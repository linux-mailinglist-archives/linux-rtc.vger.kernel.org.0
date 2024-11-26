Return-Path: <linux-rtc+bounces-2628-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5AD9D9679
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 12:50:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47B2D164DC0
	for <lists+linux-rtc@lfdr.de>; Tue, 26 Nov 2024 11:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D77041CEE80;
	Tue, 26 Nov 2024 11:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="WTMspsDB"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2071.outbound.protection.outlook.com [40.107.241.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF299193064;
	Tue, 26 Nov 2024 11:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732621799; cv=fail; b=c9YDn3hWkPgsEXgiQe42vVq5Z9eEJrsFJWNt+81cgw5/AvlwUWaA+5UzIQkSxN9kEUHR7gB9SobnS1m1GOnixnmMbwaYEiyNUfJWQAOeFRuehVWYuOkVF7lqIFxmgcizrRLQg4+Ndbwro4rLn3nZX552SqemX0gBAz2xXUe6d8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732621799; c=relaxed/simple;
	bh=/s3pHPeOKfPYBacM4Wm+nt0xKCQTkCYvYWWlNVkhEdI=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QnVCljcvfqlrVCFmyiWDtrsZh5KfETiqDrx6pPRYXxwfIDZ24ksOA3g1FrOs0ShWp4KKJ1gUqviU41Jw+9ay6ZFBgTSggmoJ+67WR6rQMnM0+CQIkYQ4+rTndvoclr6i8XzbB1B5SGVQJxJOIW9tsH8hCwIdpGbzuUDkRisA1HU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=WTMspsDB; arc=fail smtp.client-ip=40.107.241.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPMe8E2G6HBTKx85HbpgOcukg+JHNSfWLhV1pzIcajarSnNDD8W2wq86+c1o8sJXBi8N9tfkrFPqvcGolykroh+QFfwV5OpiU8S0Lgx36pfkBT7BMDE6Ieeku9WqsucKcI+Rmigm6b4ksnIixWtWvMMCaxbTN8HMZsYx435vb0KDskoPngHgckFYmm+d3HsP01gAq01nz8QGiufkSc2jk25mRwLuonpfccIlAuDY+IyfiEmSWx32+hVXipglMT8q6JzqONtYj7iOScxsBQh36F3kWBQEA3iBaqBR8HulaOtkRu0aPeVMT/M+lqMJQ0NPIH42ASxH6XmQBHB5YPFRBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8a6sLsOIRsXMEzvIT3NBqE3VDOrjDn8ju3sDqa+FLG4=;
 b=w160G0K52f1/JR2obZm/nCRkZbPYztTetNU+TgNQ5AcdJoSQXGXjeUZWmnWicklDGSEBbNj/rQbXfa36ADMo6q8j+jlUI+K+BNQq3ENeFW/mXCUfirrfB58AD3xGG/XmXIs2fxuhJq6YUogUn64hgHHppjgdzeLyD02E5hVnkxdlqonYeVgzGIC+Vk228hdkQGcHfldWRB+5qSutiPtTS4+xY4tBSsI0rh7OJVveEL9gupx3oHpMG3sP/vVcQJZh1r3CyBvNHOdNSpGakOJ4zsiernh8STyDVCXvAoSzMG6gR66ufhKleMbxmWlVDv1m0gl0OipwIoFgnERPgxKGwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8a6sLsOIRsXMEzvIT3NBqE3VDOrjDn8ju3sDqa+FLG4=;
 b=WTMspsDBzvBaE1yMNPqIK1fKN+5D5yCgF4sua31kOUgbj0t2AecvfcUvRcMVC2JsEfWs5dnvk6cSfzbpRsTkfLrqnHBv/asOuwfH+267F2BqOiPkaLvisq7q6RulN+BKow81ukItVUAu/Xc4Wt4ZPFEB5JBra3c9gCyUEHGRCqNzLM65RwknKOmhurPWu4kGeGyAK30tKDdjGlXxR+/CN+IHoIPRXRlLV43RKm+BXAw+0A9aeTLPNHiGzC5jGtha1AktrI77VlIcAOLHZOL/S3mD4/mfRBsyMVw3Yn9AJeBF+1K4xQSEk/tCJzL/sClsQXoLcWj2z6g2JaLDRT+5uA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by PA1PR04MB10294.eurprd04.prod.outlook.com (2603:10a6:102:44d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 11:49:54 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 11:49:54 +0000
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
Subject: [PATCH v5 0/4] add NXP RTC driver support for S32G2/S32G3 SoCs
Date: Tue, 26 Nov 2024 13:49:36 +0200
Message-ID: <20241126114940.421143-1-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BEXP281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10::28)
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
X-MS-Office365-Filtering-Correlation-Id: f23892b9-bcf7-4355-40d4-08dd0e10716e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eC95RU5xMDRTRGxYY0R5VzJ3L3o5aUJyQndzTzIzcTdnaTFEYlppUkh2QVV2?=
 =?utf-8?B?cFNoQ3RJMUcrSFJESzk1OVQwbHZkeU9xSDF0WXQ5TjIvbzNRZ0FxeTIwdk5W?=
 =?utf-8?B?aXpGNHJzSXRwdWN3SHZDQkxydVpwY3BEbXpKVTh5RmpIQVJYUFNnOGZ6RmdM?=
 =?utf-8?B?VDFNMEo0RkxNN3Q5b0hHMDVHZjk5WktUeHp3Yld0ODllS0V2UEYyVlZ6RTRT?=
 =?utf-8?B?UFhzRjhQM2V5ZVVpRFVMUURzbVpwN1BJa1VVMTZseFZVanNTRGszTldoMTJs?=
 =?utf-8?B?T2xSRVNaQVV3M0paekUrT1JKQVVaUnJta3FjRlFXWkJncjZMNmlrZkRnRkpl?=
 =?utf-8?B?V1NTZHQyQzB2NTRTMkdnMEtVSWVpdTk4WlFYNEM5bHJDek9vZDVQamlYYWNP?=
 =?utf-8?B?aXpxNTU1amd4QlRPRTZWa3U1VkVrYW8rWTFoQW1ZRm16aFozTDZvYi9Gbis5?=
 =?utf-8?B?UnFIUkNkcHA0MWtLRHY3b3ZCWDVndjhlL0RuRkR6bElTQUVJb3ZYUEd4U0xQ?=
 =?utf-8?B?aysyTXZObURjcnJsKzBDbTBPdi8wVXhldGhWSkpoOHRxanV2dE40NjBCNUtI?=
 =?utf-8?B?ZnlHQlZTaklBczZRdytFYWZTbkM5Ni9qMiswYWhSM0I0c3NOU3lSbjFHRXRS?=
 =?utf-8?B?OFNwZjBvVmZCdjJKV3dLUlBxQU1wWXl3VHBscjlzSHlIVEg2TjEwYUQ2akFM?=
 =?utf-8?B?UHM0YTVCR3MwZzNTbTFaWlVlQ3hvd1paVVhFZE5MZHU0aEpJTkdwTEh0bkoy?=
 =?utf-8?B?SFYzY0ZhOE1sd1dHYkxwMnFvN1dFa2s5WVZFVWtGTWJNMVFveVN4NHpFTjJs?=
 =?utf-8?B?dlpiYmV3QmxabGhZSVpObHFQekNXRGJrQmV6aHdPbkN6MDhSRkpOM0xIa0l0?=
 =?utf-8?B?TjdGUlNzWWVuV2tBTHZVSHJTWWgvMkxlMHpFNXJMTkhuT0YzUWVDdVA3bWU1?=
 =?utf-8?B?WE5DQWhxTHhheklUL21WZ0g4VUIxcEZiWlRNVVN1eUIwRE9rY1Y3cElyVnJV?=
 =?utf-8?B?RWJ1VWNsY1VDaW9QZTd6NDJ6ZW96N0NlSks3ODZjRVdOT3VZL0EzdTFWd1Rz?=
 =?utf-8?B?QnJpcDVDemU3bjFxZWZyT2c0VExzajFBTlR5VFFPc2l3Q2RPd3RBWGttaGlY?=
 =?utf-8?B?ekliZGoyc1QwdFNhSjZPQ1pPQWJNQ2hFU3ZhTW9Ea1FjWkRwdFJVY0RWTlow?=
 =?utf-8?B?VWt5MWVBTVNIbU45bGR2bWppS0pKTUozWFo4YW5uY0dvdnpBRHlCZzdjZlp4?=
 =?utf-8?B?V2V3cytHbkVKbnNJTm9PdXFremZ5WVVzbXVsanpnQmkrWjkwaFZ1Y0VOTmZV?=
 =?utf-8?B?Q3liTCtMdDFtYTYyUm5TNWlUbVQyb2F2blFwUmxpMjNKMFlITEEvNXpnbmhJ?=
 =?utf-8?B?UDQrVmhJOEhBb2xkUnd6WHk3Z3NXUlNxNllrUDhHcGFPMkVHWU96aGI3R050?=
 =?utf-8?B?ZlpWQ3ZjbkY4eTRuZU90eEErdGZaSk9PNGx1ODArWnN5eGRXQWNkQlBtV2Yx?=
 =?utf-8?B?VDlBZG5xRExCb0dOdHVFeFp2em5mUEo3c2RmM0lQeVI3RXZjL29aa2hYZTBo?=
 =?utf-8?B?cEk3WW5QdytzdEhHQ1RQR1F6WmlQWkc5anlNTEVwQzNYSHdKQXdxRi9OQ1Ns?=
 =?utf-8?B?T1hWMjRDRjRPSWlSdHpRbDdrdGRURjdKeWM0MUVCVDdSUlpXQkZseTFXbzJU?=
 =?utf-8?B?SzJFcjAwZDU4dzNHeGFKdEEraXZidVVQYXNwZ3dRcG5nN2ZnM2p0NlF5aWFZ?=
 =?utf-8?B?bFV6V3k3R3oySW9jNXhMYUYrSEJ2b3d2QVhnNEJnMDFGVnZWRGR6SEc5aEFj?=
 =?utf-8?B?YXNYV29RbCtKTVIvdE94QT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WXZSbWFPUWJlSS9abW4zaG9CN0pjQ2Q5NTU0eUpMMFRrS3J1TVNtRitNMk1G?=
 =?utf-8?B?U2ozOHE5TWtNWVVrUkVKdlpnMHVLUDlMN0pMaHBsS1NDNWVObms3RU5UOCt5?=
 =?utf-8?B?RHRVRnBrREsyYXppRmI1WnVIRzlWYld3K2dpS2J3VGVwTlJkT0RMS01UTVR5?=
 =?utf-8?B?OFhhekgza3F6N1JVN0hzV0RYVFRwdmNBMW1meGdYVHpRK2NWQ0V5WkV6TVhS?=
 =?utf-8?B?bEpVMjdEdEVvamN1dXJEd2VSMkluT3Q1YlVLWXhoTUp1OHp0NGtDNjNCamgy?=
 =?utf-8?B?ano5eDFtZDdRMy9FSnlDdjFrV05vU3lWWGlQcmdtWGxSM2FRSUc4RXBmOTYz?=
 =?utf-8?B?Qm9mU0NVSFJaOGxtREk0UGUxK1ZlcXk5dEhId0tSemZlRmZKejAxSnFycTFQ?=
 =?utf-8?B?Y2dVR2xES01VODA5NlJEMGVjUWFrb2Zsb3J1aE1HbFg5TWJ2dTkxMEZJSDlG?=
 =?utf-8?B?ZHpjbjVKNlI1Tm9rV3BBbjRtbVEwZTltQzhQQldzaVMwcS9iTnZxUW1jaDZi?=
 =?utf-8?B?MVNHU0xrejBNVHNHSXdxR3NUSnBpak44MzdrVmZlTVhiRWpqT2oxWUdLRnVx?=
 =?utf-8?B?L2tyVllLOGJpVGhqQkR0ZlAyL0U1MnVBZmNqMVFBeUVKVEJ4M1pEbFZFVHhK?=
 =?utf-8?B?RFVJMlVIOHN2L3ltZDBpK2hiblllZG40ZEpXaWdlc3FId1RIaE8rZXZpWTVx?=
 =?utf-8?B?cHF1MTlacGZLbEFzRmt4MnMzUU5mWDhpRHZLbVhSNk5yOE9OU1NIa3N5S3lr?=
 =?utf-8?B?bGFHSlBiQ0RJRHI4SUZqUFc2WFM2VmRFOElJU0NNbjUvbWZsdU1scGVzaS9Q?=
 =?utf-8?B?Q3pySDRMSGp4RE9OZEF4emVURi9oRDdUZ2t0YmVONjdXU3pHejhmZ0QzczBw?=
 =?utf-8?B?bWlib0NCcDlqcWJzOEpYMnJVSk5RNnN6RDNhYm5OV1RqaCtXd0ViMGJRbmJr?=
 =?utf-8?B?RjFWREpnWStlQStWNjNsV25DcWlqMnVPM3lEdkFEMkpGb3Q2RnhiTkcvUmpp?=
 =?utf-8?B?cHI4RGNjeGE2N2NmRm1GVG5Qcm1ieFl1enFQUEJSNTJuZTlVWmpuVzZHcGoy?=
 =?utf-8?B?eUwvZnpmSGtGTXdKQ2RjTTBsM2hpMXQra2Y2WWlvZS8yeUZqdk5aU2t3NFh6?=
 =?utf-8?B?SU80cEVpTjhlSloxZDA3MVlLTk43Ky8vRUc4MTFaT25uZ2Z3SCs2RFJ4NVNG?=
 =?utf-8?B?b3Y2THdUOGtZKzJKbjR5VnJrdDFwRVVJVUJDYTFERzg1Vm5XQmwxMDRFeCtI?=
 =?utf-8?B?ZkZIcSt2aEc0dWtNNWNoWCtlSHdFTktZS3VnRWYxQ29VU0J2SG54bmMycnZB?=
 =?utf-8?B?Y3V6NlBtL2Q2TE9BWUp1REZvd2N5ekJkcEJwMlFiY01RamJDSWQyQVUyTW9Y?=
 =?utf-8?B?OHROVElVNGhyQ3Vtem5ZbzFKRHM5dStXc1I1eFpyc2JySW5jMmZaWmFRL2sy?=
 =?utf-8?B?NmVPczVTdWJiNmhpdmtXSUVQNWp1dy9iTDBtRmtMaHBKS0pRZ1lheFE0VTlF?=
 =?utf-8?B?cXJNZWxHalg3b3dzeFZCb3ZlMDdhaW9qYmxBeVU5YU1EMDRmSmczRmdQYzIr?=
 =?utf-8?B?WmVrbzZ2aStRckpWY3YzNllUVUZ3dmxYUkNvN3R0TUFDZ3oxeHVkTjNLSitP?=
 =?utf-8?B?amVRR2J6dmhGVlUrQU01bUptM1hzWVh0UGFLN1F2SndCT2Rud0JaaXB4dE9k?=
 =?utf-8?B?Z2VPUWx5TEtqcTdIa2FPbWdzSmlaYm5lSTB5RGtqZUVOR0lEWWJmcVR0bnUz?=
 =?utf-8?B?MjRVVkdSeVREck16U2Mzd1pQMWFNRk9UZHlvUWJZRGhZV3JERTh0Z0NCb2to?=
 =?utf-8?B?WGkyWE9QRWcvekJNRVJ2TVlrQUxHWFltV3phc0Ntc3hZZkpaeVZLZHJyaWRY?=
 =?utf-8?B?czl4VmFSc0VlL3JYS1hLazYyaGxSS0c1RlIzOC9tRFoxRm5nN25yRUUwNjQy?=
 =?utf-8?B?aVU5U053UldjWlNHcFBzOGVlcmNkeXE0aTRUVHJjQ3ZPY3FYeEcxKzFDNVkx?=
 =?utf-8?B?ZTBob2tkRjJBSnNtbWVRYTBCUkMrNVRENDVZVmpNWC9qL2d2UXV1bEVaUERj?=
 =?utf-8?B?aHBiZnRwTExXbjNZdUpwKzJvUUdhMkVjUzhGTnhPR3NwbjcybjFGdHdHODlI?=
 =?utf-8?B?eHlCZmJoMG5GUWwxVXZkbzRVaEQySUkrcHdzSFRFSnJOTU5QR1pFMkNxb29p?=
 =?utf-8?B?bXc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f23892b9-bcf7-4355-40d4-08dd0e10716e
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 11:49:54.3691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l5v9ocN1PAak6ngykJ6+iUL35dOiVceOgs6lMwVsrISncT9RDRJxqYJqFql6nySVhYCy9mmgdMCuTg0/WAWEndJJjdSAZci7tWm6JEST6nA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10294

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

This patch series add support for the NXP RTC hardware module present on
S32G2/S32G3 SoCs.

RTC tracks clock time during system suspend. It is used as a time-based
wakeup source for the S32G2/S32G3 SoCs.

RTC is not battery-powered and it is not kept alive during system reset.

Following is an example of Suspend to RAM trigger on S32G2/S32G3 SoCs,
using userspace tools such as rtcwake:
# rtcwake -s 2 -m mem
# rtcwake: assuming RTC uses UTC ...
# rtcwake: wakeup from "mem" using /dev/rtc0 at Wed Feb  6 06:28:36 2036
#

Changes in V5:
- Removed rollover support.
- Removed clock switching support between Runtime and Suspend. A clock source
  which is always available has been used instead.
- Enabled 512 value RTC hardware frequency divisor to achieve higher rollover
  time
- Removed unneeded 'remove' callback.
- Decreased driver print verbosity on error paths.
- Provided 'clock-names' actual names in bindings documentation
- Remove __maybe_unused notations. Used the DEFINE_SIMPLE_DEV_PM_OPS() and
  pm_sleep_ptr() macros to handle the .suspend/.resume callbacks.
- Fixed some alignment issues.

Changes in V4:
- Dropped 'assigned-*' clock management approach. Simplified RTC Runtime
  and Suspend/Standby clock configuration.
- Simplified error paths on probe function
- Removed node label from bindings example
- Several cosmetic coding style fixes

Changes in V3:
- Removed 'nxp,s32g3-rtc' compatible string
- Change to 'remove' callback from 'remove_new'
- Used 'dev.parent' from 'struct rtc_device' instead of defining a
  specific 'struct device' in driver data
- Fixed several errors reported by kernel test robot
- Removed 'assigned-clocks', 'assigned-clock-parents' and
  'assigned-clock-rates' from required properties in the binding
  documentation.
- Refactored S32G RTC driver such that a default clock source and
  divisors configuration will be applied in case 'assigned-clocks' and
  'assigned-clock-parents' properties are missing.

Changes in V2:
- Removed 'clksel' support from dts bindings. Used clock parents support
  from CCF to better illustrate the RTC hardware IP from S32G2/S32G3.
- Removed frequency dividers support from dts bindings. Used assigned
  clock frequencies support from CCF instead.
- Reduced the interval while RTC is voluntarily disabled to a simple
  register write in order to avoid any race condition between a possbile
  rollover and 'suspend' callback execution flow.
- Updated bindings documentation with respect to clocking support.
- Fixed a potential unused variable warning reported by kernel test robot.
- Updated to usage of 'devm_rtc_allocate_device' and 'devm_rtc_register_device'
  instead of deprecated 'devm_rtc_device_register'.

Ciprian Marian Costea (4):
  dt-bindings: rtc: add schema for NXP S32G2/S32G3 SoCs
  rtc: s32g: add NXP S32G2/S32G3 SoC support
  arm64: defconfig: add S32G RTC module support
  MAINTAINERS: add NXP S32G RTC driver

 .../devicetree/bindings/rtc/nxp,s32g-rtc.yaml |  69 +++
 MAINTAINERS                                   |   2 +
 arch/arm64/configs/defconfig                  |   1 +
 drivers/rtc/Kconfig                           |  11 +
 drivers/rtc/Makefile                          |   1 +
 drivers/rtc/rtc-s32g.c                        | 554 ++++++++++++++++++
 6 files changed, 638 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/nxp,s32g-rtc.yaml
 create mode 100644 drivers/rtc/rtc-s32g.c

-- 
2.45.2


