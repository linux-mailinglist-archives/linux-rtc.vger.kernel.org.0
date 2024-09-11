Return-Path: <linux-rtc+bounces-1929-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 008EC974AD3
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 09:01:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 20B951C21D45
	for <lists+linux-rtc@lfdr.de>; Wed, 11 Sep 2024 07:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BCB513C3F9;
	Wed, 11 Sep 2024 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ivgmpW8t"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03on2060.outbound.protection.outlook.com [40.107.105.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B8D13AA3F;
	Wed, 11 Sep 2024 07:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.105.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726038047; cv=fail; b=jk6tGRFH8NvzpA/lJC4Af0l0yyqUb17kovSESUkbCKnDON198nJEPKC8NaR382RnerrRAl3MVe9NTHTzZu0L+cAxRKH/Kk8PDIcuEE5ggFvgn90ceR8y4FWY8l0Zl3K+dguUszbHDuRYe1edMaswLycS2AHNd0hU8+jpmTs9KPE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726038047; c=relaxed/simple;
	bh=n+BH1dz6Ru0K2IYaN3Qdw0sEu5nqFFBXq75jET1wem8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gSdD1YBv2jE+1YC54ijeTdMutGYa/VeXX5iEmwHZM2OnEzbv7XtQYDLL8GX7nFrPlB9BtiJ0spng6nchRM++AMzKJ1JutsZXE5hqMNuN47Y9gVioasmx4xkoYnyxdsf1D/jXfwenfDaFtUer/CSLQAydR6J/QA44IHigr13XP3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ivgmpW8t; arc=fail smtp.client-ip=40.107.105.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QVwUQ5gAn+zZDmyMkgmYEfzfQx7wuaZtybNFNUQz14d/W9x4hgVNDa16Yr9y9jcBpsqxtjtuo8DY7PqkvMiW6MHeqNOOH1i54gyMJ1yhmw1uBCTqwEyQvVJrFtGrLnmn/WwrFtrYFs1B41AEXKghW5zhbDn6vTlxaBRZ7xwHv8QtC3PmFJ7g/uyFt3eVoM3sQtmmxzuZ1wxs1kqvBzvVeAlKmhbYAH7QjH7/r4GRofsKUwzNY40ij7gKkkZkmToir/9ZF2pPvAnl+/NesBYrjSJwySDVZ4r02llQ4PmcfcLGdHMdUtqOaAetWh957rM5tKmawtx65YnDtaBn839J3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLDjVZYuc+vDait61JE/NxDy77AT/IWt/g4VFQffAzI=;
 b=ESY7Wfp5jKQfNtAhV3rAOLPZmWv75mjjmp/l6D9LFwD4a2b0vBOCW1498jGjxrvchx+u9PPieHviPb8/RuOXyk1ZTNwhdmVCUzEf6agaNHo1ZGrMxwzIkMr/riWR4nQ1xe/wqwnB8+Wkeuc/wZRDZ2HMN+6z9cZ8RV/B9MOWfgGCbG4Ij8LoNp3kjt+LAoWVca1cY9EisdTyMIqITArlFeU+5qIvBadScRgVrOYGECdHyRzksv+s9yI3g/wiRY47szWpJPGipw8WU+kO/jVKfykvR5rnfTDesNjiuTBPMwjACR9/wsjN30EYZ69tzpls4i9JnIMd8dEd7Tj8qvna4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLDjVZYuc+vDait61JE/NxDy77AT/IWt/g4VFQffAzI=;
 b=ivgmpW8tJEZpsy/tF7DJqKONP1vBwBqdoy5lhrk8WCZ0vPKqmexX1pwrNkYA9guKNj4EwToH3WssGQPhbJrnEp3yY+cOAzltA/caZqDMbf/On/cKk1hoJhMQm+LcrCbf1PWENtyj0AiVjLM4SFLzVnhHO9bUPxVAQ6TjdQ9qWtofb+Aj7UU4gNJx24aiDmmToGA4WKVLolG87i0RGht7JxUwbeFIBDmNDul3nkcGV8shacxIdq9GykHHuUu+3ukNqB2RTAMr7Xf8yFtPJS9qa3b0Tb/FO3agJXWmJLUlA6xfzljoaJSc/IoFb1exQ5rywnTx8jG0a6WX8eCi/tADiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AS4PR04MB9507.eurprd04.prod.outlook.com (2603:10a6:20b:4ca::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Wed, 11 Sep
 2024 07:00:40 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%7]) with mapi id 15.20.7939.022; Wed, 11 Sep 2024
 07:00:39 +0000
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
	NXP S32 Linux Team <s32@nxp.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Bogdan Hamciuc <bogdan.hamciuc@nxp.com>,
	Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Subject: [PATCH 2/4] rtc: s32g: add NXP S32G2/S32G3 SoC support
Date: Wed, 11 Sep 2024 10:00:26 +0300
Message-ID: <20240911070028.127659-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
References: <20240911070028.127659-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0127.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::24) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AS4PR04MB9507:EE_
X-MS-Office365-Filtering-Correlation-Id: 198a16e7-2c9a-42ae-5056-08dcd22f71d3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnFKYnlNZnZUdFRvN3QzMHFKRHBISk9EbFBNT1dWUmMvOHg0TFRyMC9LRFYz?=
 =?utf-8?B?WWc0eVZUTEppL3hmdk4zRFMxdXdOb3lWZmI4VnFyS0lOcHRBVnY5ZXFEUUFh?=
 =?utf-8?B?ODJySWl6bmdXN0Qwb0NmRmpuYlBMbkFMNGdvWG5TT2hNWXd5OEpPM1hGekpY?=
 =?utf-8?B?RklPd2Rmb2VzLzBENmNNK25aeEh5Vjd0NTJwbk9seGJINDBMSWFGL2NFeXpn?=
 =?utf-8?B?OTZKdXljMHFsR3lNVVN4SmdRVy9FeWQwSm5JZ2FSRUVMQVFxclNHNHZhM1NZ?=
 =?utf-8?B?TGJhd282V2JTRW1jbnRsTk9zbjNONDVCOTV1R0drSzRlRGN0dXloc0FLMmFj?=
 =?utf-8?B?V0dUWUIxQ01VOHJZVW9mWDV1d3Z5eXFVTjA1bG9yN1h6NU03dTh1TjBXZU5v?=
 =?utf-8?B?Wlk4RkFUNmpIdHdCckpXMnFFL3pNczlBQ2x3VklRYWxoSHJzUXV6NE52U3RV?=
 =?utf-8?B?bUh5ZG1JV2doaEQ2UzlVUHk2TU03aXFydDg0dkswR0pXeWdEUXBJdDNhL0VI?=
 =?utf-8?B?TTEvbHhjME11SXJiK2dkT1cybXQ2USs1ajQ3aHFBRU9aQzEzYU1FazBmekpn?=
 =?utf-8?B?TDJmenVRem91VGZCdlNIWFlLVENLcHZ4dmNSa2Rub1lzcUsrdDdEUFBWVXp0?=
 =?utf-8?B?QnIrMnBSV2F6WjJRdEplSTlyTzRUVXNrRmVaOVhLS0JKb3BZTDFZOTIwUzYv?=
 =?utf-8?B?amlqd0ZPams4U1dFUmtkNXJEa1pvekxGTXRiNDFqLzk5SGNkdXprK3U2RXEr?=
 =?utf-8?B?SUZJV2xJT2NOc3ViMFlQbzZ6SEpjUVVaa3JqMlRGZko5bFRPNXZTMGp4dW0x?=
 =?utf-8?B?YTZjK0RsamJtVmlud09xZHhlVDB6MlNCSGx1MFY2TmJJenczNjNZdFplOUNZ?=
 =?utf-8?B?OW9NOWIyK0F0U1pGbUpacCtZamFHSHdGanA2Wm5zYVBYV2FvVkk1MzUzMmY4?=
 =?utf-8?B?WHhGZDMzY1JNcm5PRjdYQWwxRFFZUFFLZ2tyTzhTWG1UNGx1QkxoQTcyR3JG?=
 =?utf-8?B?UTNYQzgwNEFxVGlpZUJxL1hQUzBEbDJMSUFpMm45U01ISFpUTlZ2V3R4RHds?=
 =?utf-8?B?andtdCtnaGJmSjZKQUhIUHpGVHNMclNFL0ZmMng1MGZiMXdiNjJtcUgrWHNF?=
 =?utf-8?B?UGxGOEpDYThqcDNRTkdQVGFhT2tmR1VIVFBSenBYaXRQaTgvbERNRE95d3NX?=
 =?utf-8?B?L0tGbzY2aXJCbEp5Z1dCaTREcVk0cDF6NEVBL3MrZ2krVHVuVEh3bk5wY1NL?=
 =?utf-8?B?MHJ3TWM3MTJOeHBvRFRWSHhuRmlKRkplWWtLNStCd092OTVjYUw5d3hLU2ZU?=
 =?utf-8?B?eDJKbm9kOHBKN0JFdHdoblVnL0lVbWYyUFFPWkNxVTBRdGM1Wjg3MW4zV2p2?=
 =?utf-8?B?VDBlVVFSRUN0M3dJbUlVbzFwZXpHWmZqS1hKeFZkWFV2UklTZzFuOUlBbXdV?=
 =?utf-8?B?SHdESzQ0MlIvenliQmpHOERoN2ZyQ1BKTGZyNEtDckRVSzhzekExcmtYa0dq?=
 =?utf-8?B?dGhLWjg3bVpRanpObUNJSmpwSFFOYlZ3VjJLdDdsdWxMVkNuYmJheVdQdWky?=
 =?utf-8?B?aFROQ0JrVlRJdG1GUElaREloUktiQkdVNDdHZ2RzYzdnRGx5ZS9zdGtVQVZj?=
 =?utf-8?B?WUNvM0ltMU51Nkw3S2JUZFJ1Tlloancza09WUDJ5UEgzYU9TRFFVWGphZzlO?=
 =?utf-8?B?Rzg4dkJlQ2VaV1lsME8zNVJwT0ZZYXJ3ZW9HZ204MUhuYmdQVEhjcDM5T284?=
 =?utf-8?B?bEQ4MDlFanJQN1I4dnVNRndicFREQjZ1UUl2UnpiYUpST0MrL2NVOU5DajZW?=
 =?utf-8?B?TXVXeXd2and1ckxnc1NWUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0lzM3p3TVpNcTR3OFE0bHlINmp3UVBBejRMamlwQlZraVEwSGdZOVBYTTB0?=
 =?utf-8?B?aUR0TEVLM0NQSHNoWWs3RnZ2a0lpS0hqR2Y0ODQrVWJPeHNSelZaYXlwclh3?=
 =?utf-8?B?MyswN1ZlQW9PUlhEcjhaTU0wZWZ4MDZraWRCamxjdmFnU1lBUWZ4ZkFpY3hY?=
 =?utf-8?B?cDBZdkowMnUwaVVOU0NoN29xQjBycXRTalVBV0JuclJvM1BwU1BQUFpKNGxD?=
 =?utf-8?B?L3Y2QVBpWDB1K3hkMDVYNjhuV2Z1OGtLcFdidmFyQVc5ZmxVZXpSRm9XY3pD?=
 =?utf-8?B?RmdDcTNIR3hPQk96NmVFNFhsSW9Ca1h3SHROSFpLcHpxL3ViNHhxTkVrVWVY?=
 =?utf-8?B?SnYzeCs2bXpDNnk4V1VBUFFkYTZ0cjNJVUhSR3ZpMFJlbHZuZUd1V3Q4ZVRD?=
 =?utf-8?B?S0ZZaTNQQUE4c2JxWXp4M1VKUmxpOGtHVmFWNDgvbGVrMEZRNXNGTWpabEMx?=
 =?utf-8?B?ek0rSEdSdDVWdVE0SXNGUlc3WHMrdER0Mjh1QXdoMDhoalZLcGhiQjhNU0Rh?=
 =?utf-8?B?dytBSTVkaWEyelM4dVJqS0dNcHJ0RG05UkxINXFvc0FUaTZjaFR2dDNmdGM1?=
 =?utf-8?B?eS9UKy9vaitrOEtTV3RQY2VOYmhRNThxY0g1UlVBMkI3ODNlN0Mwb3BLdENt?=
 =?utf-8?B?RUtyZWF3ajNGcTFSbFQ2SUpqQ0cvVy9XL2pySlpFOUtrVWRXeStmMTdSSHNv?=
 =?utf-8?B?azlYY2VNbm5CSUVnMGpKcGVBWHRpdzYxc1V1RnRCQzZzS0ZURUpXd01MWDBo?=
 =?utf-8?B?OCs2RDlXRkVPSGE0aEE1S3dpWlN5Z0h2bHpQUlVQNklDN0tkQ28zNXRFWno1?=
 =?utf-8?B?Qm5LZFRucGVlNkZPazBHaXFnSVFlRklUaSs2dkFWVnJLSnVrek1mdmJ4WVlo?=
 =?utf-8?B?SWhxYjhrOTFJbElnYUFudysvcjg1Z1J5QlZ0TWdaQmtHUVpRdnpFTm1wZnZF?=
 =?utf-8?B?bWlPbVpGdkh3aFkxU3UxRmt1REhhM2txSzZsNDdPUVlCNmNpaUNaMXNER0NB?=
 =?utf-8?B?Q212TVNIWDdsVThMZnM3SkdjcThwaDluNENOamJSeW4vMFpxcDc0T0prRjFE?=
 =?utf-8?B?K3BSQURROG5FaXhRc0RYTmNsL0dBcDV3QlQ0M0JKZ3NFMzVyWXgrM3JUVnNC?=
 =?utf-8?B?VFRpODVyV0lRdVJMaXRaV0xTclpSRzlpWEM2N1lvNDFMdWdLY2toSnRJWXlm?=
 =?utf-8?B?NFc4QVc4VG1VYmRDQTdXNnhjTGxCcFNCRFAwTkxkTE0vQUlCa1lkYXpZTTJ5?=
 =?utf-8?B?SmJPVExEWGR5N3p4emhGSWQ5ZXBOekl5NVRBemZ3QkFVeEd4NnBFOG5qYzNV?=
 =?utf-8?B?WW5oR2dKVGcvYWF0NmpiQ3ZqNGVZQU05WG80eWVpa2g5ajhEM3JYNDJNQkwv?=
 =?utf-8?B?VnhsODc2VFRqL3I1Z0xzMjJDNjRpN09KRkFaRkVZQndjNjFrKzRlV2FKS1NP?=
 =?utf-8?B?UzAyN2pJTnl2aXZwS0NENzhIeFpZVHhwOTYwTmJBV2RVdGZhSWZzTk8xMUoy?=
 =?utf-8?B?Q1dHMmlCelROeFNyRWFDMUhEY1gyYkE0dlhnT0pibisyWXhYSWZaaWZ5eHdu?=
 =?utf-8?B?dnlRaFBNNzM4enZsU08wbno1UENpQU84eCtQYm5iMDdLczFsVFltRDhGYVVx?=
 =?utf-8?B?VVg3Nk02dml2ZzhnNVpBQVNKSFl6cThoRG85UDlXTklxYmt5YnJ5czFUMnR0?=
 =?utf-8?B?SWUxVXBpVGVTTWorUVowdmc3ZjQzc1V1WFFwamExUm83SlcwVGZ6UEpCWXhO?=
 =?utf-8?B?RTRoVDRZdlU0VjRuUjlRL1dvb2pCWER2OHNjMmxzYm5aa2hoQStlTWNFOGRl?=
 =?utf-8?B?elpCd1JqMDg4bFpOVkFlOWpFSXVrTThCenA4aDNVemxPVXljQVBNT3pid3lF?=
 =?utf-8?B?U2M3R0dCdTZrTVU0dUR0OTZUVUZGczRyL2dBODRPMkFkMUxEajdhYk5oYzhs?=
 =?utf-8?B?NmlUU1dkUXpCalFuV1lSL2lNZVhpeWxEU0tJQndwUkdMM1RhOEIwRWdGTjk4?=
 =?utf-8?B?eDErcWtDY1BDN0FLdmZ6bmtzU3pUZzY0L1ZaKzc4eXJiei9VMHh0b0duZDZZ?=
 =?utf-8?B?cUNZUmZzT2JTdWlwd1Rod09jb0NpNVI2a2ZON3BLRXAwOVQ2NUF3Sngya3Q2?=
 =?utf-8?B?NUpjdjB1R1kwNDRDYVIra0xsS0pRc0VqN2I0YnJmOGt1blN1WjZJWWEzK3BD?=
 =?utf-8?B?TGc9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 198a16e7-2c9a-42ae-5056-08dcd22f71d3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 07:00:39.8445
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpW8WE3/DLfk9H5629xrHd2EWEbSifAsdqISsAlIHCcJP9JXnfVcn2qrjroZqaFIvsllpSbhVPaoNVnIt0mV8dY2uV9o1aUCuKrPbqYRKuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9507

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

Add a RTC driver for NXP S32G2/S32G3 SoCs.

The RTC module is used to enable Suspend to RAM (STR) support
on NXP S32G2/S32G3 SoC based boards.
RTC tracks clock time during system suspend.

Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/rtc/Kconfig    |  10 +
 drivers/rtc/Makefile   |   1 +
 drivers/rtc/rtc-s32g.c | 689 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 700 insertions(+)
 create mode 100644 drivers/rtc/rtc-s32g.c

diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
index 2a95b05982ad..552eecd78f88 100644
--- a/drivers/rtc/Kconfig
+++ b/drivers/rtc/Kconfig
@@ -2043,4 +2043,14 @@ config RTC_DRV_SSD202D
 	  This driver can also be built as a module, if so, the module
 	  will be called "rtc-ssd20xd".
 
+config RTC_DRV_S32G
+	tristate "RTC driver for S32G2/S32G3 SoCs"
+	depends on ARCH_S32 || COMPILE_TEST
+	help
+	  Say yes to enable RTC driver for platforms based on the
+	  S32G2/S32G3 SoC family.
+
+	  This RTC module can be used as a wakeup source.
+	  Please note that it is not battery-powered.
+
 endif # RTC_CLASS
diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
index 3004e372f25f..36d2ed5d0ae2 100644
--- a/drivers/rtc/Makefile
+++ b/drivers/rtc/Makefile
@@ -157,6 +157,7 @@ obj-$(CONFIG_RTC_DRV_RX8025)	+= rtc-rx8025.o
 obj-$(CONFIG_RTC_DRV_RX8111)	+= rtc-rx8111.o
 obj-$(CONFIG_RTC_DRV_RX8581)	+= rtc-rx8581.o
 obj-$(CONFIG_RTC_DRV_RZN1)	+= rtc-rzn1.o
+obj-$(CONFIG_RTC_DRV_S32G)	+= rtc-s32g.o
 obj-$(CONFIG_RTC_DRV_S35390A)	+= rtc-s35390a.o
 obj-$(CONFIG_RTC_DRV_S3C)	+= rtc-s3c.o
 obj-$(CONFIG_RTC_DRV_S5M)	+= rtc-s5m.o
diff --git a/drivers/rtc/rtc-s32g.c b/drivers/rtc/rtc-s32g.c
new file mode 100644
index 000000000000..e77ff0c065ba
--- /dev/null
+++ b/drivers/rtc/rtc-s32g.c
@@ -0,0 +1,689 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright 2024 NXP
+ */
+
+#include <linux/clk.h>
+#include <linux/of_irq.h>
+#include <linux/err.h>
+#include <linux/platform_device.h>
+#include <linux/rtc.h>
+#include <linux/iopoll.h>
+
+#define RTCSUPV_OFFSET	0x0ul
+#define RTCC_OFFSET	0x4ul
+#define RTCS_OFFSET	0x8ul
+#define RTCCNT_OFFSET	0xCul
+#define APIVAL_OFFSET	0x10ul
+#define RTCVAL_OFFSET	0x14ul
+
+/* RTCSUPV fields */
+#define RTCSUPV_SUPV		BIT(31)
+
+/* RTCC fields */
+#define RTCC_CNTEN		BIT(31)
+#define RTCC_RTCIE_SHIFT	30
+#define RTCC_RTCIE		BIT(RTCC_RTCIE_SHIFT)
+#define RTCC_ROVREN		BIT(28)
+#define RTCC_APIEN		BIT(15)
+#define RTCC_APIIE		BIT(14)
+#define RTCC_CLKSEL_MASK	GENMASK(13, 12)
+#define RTCC_CLKSEL(n)		(((n) << 12) & RTCC_CLKSEL_MASK)
+#define RTCC_DIV512EN		BIT(11)
+#define RTCC_DIV32EN		BIT(10)
+
+/* RTCS fields */
+#define RTCS_RTCF		BIT(29)
+#define RTCS_INV_RTC		BIT(18)
+#define RTCS_APIF		BIT(13)
+#define RTCS_ROVRF		BIT(10)
+
+#define ROLLOVER_VAL		0xFFFFFFFFULL
+#define RTC_SYNCH_TIMEOUT	(100 * USEC_PER_MSEC)
+
+/* Clock sources - usable with RTCC_CLKSEL */
+#define S32G_RTC_SOURCE_SIRC	0x0
+#define S32G_RTC_SOURCE_FIRC	0x2
+
+struct rtc_time_base {
+	s64 sec;
+	u64 cycles;
+	u64 rollovers;
+#ifdef CONFIG_PM_SLEEP
+	struct rtc_time tm;
+#endif
+};
+
+struct rtc_priv {
+	struct rtc_device *rdev;
+	struct device *dev;
+	u8 __iomem *rtc_base;
+	struct clk *firc;
+	struct clk *sirc;
+	struct clk *ipg;
+	struct rtc_time_base base;
+	u64 rtc_hz;
+	u64 rollovers;
+	int dt_irq_id;
+	u8 clk_source;
+	bool div512;
+	bool div32;
+};
+
+static u64 cycles_to_sec(u64 hz, u64 cycles)
+{
+	return cycles / hz;
+}
+
+/*
+ * Convert a number of seconds to a value suitable for RTCVAL in our clock's
+ * current configuration.
+ * @rtcval: The value to go into RTCVAL[RTCVAL]
+ * Returns: 0 for success, -EINVAL if @seconds push the counter at least
+ *          twice the rollover interval
+ */
+static int sec_to_rtcval(const struct rtc_priv *priv,
+			 unsigned long seconds, u32 *rtcval)
+{
+	u32 rtccnt, delta_cnt;
+	u32 target_cnt = 0;
+
+	/* For now, support at most one rollover of the counter */
+	if (!seconds || seconds > cycles_to_sec(priv->rtc_hz, ULONG_MAX))
+		return -EINVAL;
+
+	/*
+	 * RTCCNT is read-only; we must return a value relative to the
+	 * current value of the counter (and hope we don't linger around
+	 * too much before we get to enable the interrupt)
+	 */
+	delta_cnt = seconds * priv->rtc_hz;
+	rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
+
+	if (~rtccnt < delta_cnt)
+		target_cnt = (delta_cnt - ~rtccnt);
+	else
+		target_cnt = rtccnt + delta_cnt;
+
+	/*
+	 * According to RTCVAL register description,
+	 * its minimum value should be 4.
+	 */
+	if (unlikely(target_cnt < 4))
+		target_cnt = 4;
+
+	*rtcval = target_cnt;
+
+	return 0;
+}
+
+static irqreturn_t rtc_handler(int irq, void *dev)
+{
+	struct rtc_priv *priv = platform_get_drvdata(dev);
+	u32 status;
+
+	status = ioread32(priv->rtc_base + RTCS_OFFSET);
+	if (status & RTCS_ROVRF) {
+		if (priv->rollovers == ULONG_MAX)
+			priv->rollovers = 0;
+		else
+			priv->rollovers++;
+	}
+
+	if (status & RTCS_RTCF) {
+		iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
+		rtc_update_irq(priv->rdev, 1, RTC_AF);
+	}
+
+	if (status & RTCS_APIF)
+		rtc_update_irq(priv->rdev, 1, RTC_PF);
+
+	iowrite32(status, priv->rtc_base + RTCS_OFFSET);
+
+	return IRQ_HANDLED;
+}
+
+static int get_time_left(struct device *dev, struct rtc_priv *priv,
+			 u32 *sec)
+{
+	u32 rtccnt = ioread32(priv->rtc_base + RTCCNT_OFFSET);
+	u32 rtcval = ioread32(priv->rtc_base + RTCVAL_OFFSET);
+
+	if (rtcval < rtccnt) {
+		dev_err(dev, "RTC timer expired before entering suspend\n");
+		return -EIO;
+	}
+
+	*sec = cycles_to_sec(priv->rtc_hz, rtcval - rtccnt);
+
+	return 0;
+}
+
+static int s32g_rtc_get_time_or_alrm(struct rtc_priv *priv,
+				     u32 offset)
+{
+	u64 cycles, sec, base_cycles;
+	u32 counter;
+
+	counter = ioread32(priv->rtc_base + offset);
+	cycles = priv->rollovers * ROLLOVER_VAL + counter;
+	base_cycles = priv->base.cycles + priv->base.rollovers * ROLLOVER_VAL;
+
+	if (cycles < base_cycles)
+		return -EINVAL;
+
+	cycles -= base_cycles;
+	sec = priv->base.sec + cycles_to_sec(priv->rtc_hz, cycles);
+
+	return sec;
+}
+
+static int s32g_rtc_read_time(struct device *dev,
+			      struct rtc_time *tm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u64 sec;
+
+	if (!tm)
+		return -EINVAL;
+
+	sec = s32g_rtc_get_time_or_alrm(priv, RTCCNT_OFFSET);
+	if (sec < 0)
+		return -EINVAL;
+
+	rtc_time64_to_tm(sec, tm);
+
+	return 0;
+}
+
+static int s32g_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 rtcc, sec_left;
+	u64 sec;
+
+	if (!alrm)
+		return -EINVAL;
+
+	sec = s32g_rtc_get_time_or_alrm(priv, RTCVAL_OFFSET);
+	if (sec < 0)
+		return -EINVAL;
+
+	rtc_time64_to_tm(sec, &alrm->time);
+
+	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+	alrm->enabled = sec && (rtcc & RTCC_RTCIE);
+
+	alrm->pending = 0;
+	if (alrm->enabled && !get_time_left(dev, priv, &sec_left))
+		alrm->pending = !!sec_left;
+
+	return 0;
+}
+
+static int s32g_rtc_alarm_irq_enable(struct device *dev, unsigned int enabled)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 rtcc;
+
+	if (!priv->dt_irq_id)
+		return -EIO;
+
+	/*
+	 * RTCIE cannot be deasserted because it will also disable the
+	 * rollover interrupt.
+	 */
+	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+	if (enabled)
+		rtcc |= RTCC_RTCIE;
+
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+
+	return 0;
+}
+
+static int s32g_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	struct rtc_time time_crt;
+	long long t_crt, t_alrm;
+	int ret = 0;
+	u32 rtcval, rtcs;
+
+	iowrite32(0x0, priv->rtc_base + RTCVAL_OFFSET);
+
+	t_alrm = rtc_tm_to_time64(&alrm->time);
+
+	/*
+	 * Assuming the alarm is being set relative to the same time
+	 * returned by our s32g_rtc_read_time callback
+	 */
+	ret = s32g_rtc_read_time(dev, &time_crt);
+	if (ret)
+		return ret;
+
+	t_crt = rtc_tm_to_time64(&time_crt);
+	if (t_alrm <= t_crt) {
+		dev_warn(dev, "Alarm is set in the past\n");
+		return -EINVAL;
+	}
+
+	ret = sec_to_rtcval(priv, t_alrm - t_crt, &rtcval);
+	if (ret) {
+		dev_warn(dev, "Alarm is set too far in the future\n");
+		return ret;
+	}
+
+	ret = read_poll_timeout(ioread32, rtcs, !(rtcs & RTCS_INV_RTC),
+				0, RTC_SYNCH_TIMEOUT, false, priv->rtc_base + RTCS_OFFSET);
+	if (ret) {
+		dev_err(dev, "Synchronization failed\n");
+		return ret;
+	}
+
+	iowrite32(rtcval, priv->rtc_base + RTCVAL_OFFSET);
+
+	return 0;
+}
+
+static int s32g_rtc_set_time(struct device *dev,
+			     struct rtc_time *time)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+
+	if (!time)
+		return -EINVAL;
+
+	priv->base.rollovers = priv->rollovers;
+	priv->base.cycles = ioread32(priv->rtc_base + RTCCNT_OFFSET);
+	priv->base.sec = rtc_tm_to_time64(time);
+
+	return 0;
+}
+
+static const struct rtc_class_ops rtc_ops = {
+	.read_time = s32g_rtc_read_time,
+	.set_time = s32g_rtc_set_time,
+	.read_alarm = s32g_rtc_read_alarm,
+	.set_alarm = s32g_rtc_set_alarm,
+	.alarm_irq_enable = s32g_rtc_alarm_irq_enable,
+};
+
+static void rtc_disable(struct rtc_priv *priv)
+{
+	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+
+	rtcc &= ~RTCC_CNTEN;
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static void rtc_enable(struct rtc_priv *priv)
+{
+	u32 rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+
+	rtcc |= RTCC_CNTEN;
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static int rtc_init(struct rtc_priv *priv)
+{
+	struct device *dev = priv->dev;
+	struct clk *sclk;
+	u32 rtcc = 0;
+	u32 clksel;
+	int ret;
+
+	ret = clk_prepare_enable(priv->ipg);
+	if (ret) {
+		dev_err(dev, "Cannot enable 'ipg' clock, error: %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(priv->sirc);
+	if (ret) {
+		dev_err(dev, "Cannot enable 'sirc' clock, error: %d\n", ret);
+		goto disable_ipg_clk;
+	}
+
+	ret = clk_prepare_enable(priv->firc);
+	if (ret) {
+		dev_err(dev, "Cannot enable 'firc' clock, error: %d\n", ret);
+		goto disable_sirc_clk;
+	}
+
+	/* Make sure the RTC ticking is disabled before we configure dividers */
+	rtc_disable(priv);
+
+	clksel = RTCC_CLKSEL(priv->clk_source);
+	rtcc |= clksel;
+
+	/* Precompute the base frequency of the clock */
+	switch (clksel) {
+	case RTCC_CLKSEL(S32G_RTC_SOURCE_SIRC):
+		sclk = priv->sirc;
+		break;
+	case RTCC_CLKSEL(S32G_RTC_SOURCE_FIRC):
+		sclk = priv->firc;
+		break;
+	default:
+		dev_err(dev, "Invalid clksel value: %u\n", clksel);
+		ret = -EINVAL;
+		goto disable_firc_clk;
+	}
+
+	priv->rtc_hz = clk_get_rate(sclk);
+	if (!priv->rtc_hz) {
+		dev_err(dev, "Invalid RTC frequency\n");
+		ret = -EINVAL;
+		goto disable_firc_clk;
+	}
+
+	/* Adjust frequency if dividers are enabled */
+	if (priv->div512) {
+		rtcc |= RTCC_DIV512EN;
+		priv->rtc_hz /= 512;
+	}
+
+	if (priv->div32) {
+		rtcc |= RTCC_DIV32EN;
+		priv->rtc_hz /= 32;
+	}
+
+	rtcc |= RTCC_RTCIE | RTCC_ROVREN;
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+
+	return 0;
+
+disable_firc_clk:
+	clk_disable_unprepare(priv->firc);
+disable_sirc_clk:
+	clk_disable_unprepare(priv->sirc);
+disable_ipg_clk:
+	clk_disable_unprepare(priv->ipg);
+	return ret;
+}
+
+static int priv_dts_init(struct rtc_priv *priv)
+{
+	struct device *dev = priv->dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	u32 clksel = S32G_RTC_SOURCE_SIRC;
+	/* div512 and div32 */
+	u32 div[2] = { 0 };
+	int ret;
+
+	priv->sirc = devm_clk_get(dev, "sirc");
+	if (IS_ERR(priv->sirc)) {
+		dev_err(dev, "Failed to get 'sirc' clock\n");
+		return PTR_ERR(priv->sirc);
+	}
+
+	priv->firc = devm_clk_get(dev, "firc");
+	if (IS_ERR(priv->firc)) {
+		dev_err(dev, "Failed to get 'firc' clock\n");
+		return PTR_ERR(priv->firc);
+	}
+
+	priv->ipg = devm_clk_get(dev, "ipg");
+	if (IS_ERR(priv->ipg)) {
+		dev_err(dev, "Failed to get 'ipg' clock\n");
+		return PTR_ERR(priv->ipg);
+	}
+
+	priv->dt_irq_id = platform_get_irq(pdev, 0);
+	if (priv->dt_irq_id < 0) {
+		dev_err(dev, "Error reading interrupt # from dts\n");
+		return priv->dt_irq_id;
+	}
+
+	ret = device_property_read_u32_array(dev, "nxp,dividers", div,
+					     ARRAY_SIZE(div));
+	if (ret) {
+		dev_err(dev, "Error reading dividers configuration, err: %d\n", ret);
+		return ret;
+	}
+
+	ret = device_property_read_u32(dev, "nxp,clksel", &clksel);
+	if (ret) {
+		dev_err(dev, "Error reading clksel configuration, err: %d\n", ret);
+		return ret;
+	}
+
+	priv->div512 = !!div[0];
+	priv->div32 = !!div[1];
+
+	switch (clksel) {
+	case S32G_RTC_SOURCE_SIRC:
+	case S32G_RTC_SOURCE_FIRC:
+		priv->clk_source = clksel;
+		break;
+	default:
+		dev_err(dev, "Unsupported clksel: %d\n", clksel);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int rtc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rtc_priv *priv;
+	int ret = 0;
+
+	priv = devm_kzalloc(dev, sizeof(struct rtc_priv),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->rtc_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->rtc_base)) {
+		dev_err(dev, "Failed to map registers\n");
+		return PTR_ERR(priv->rtc_base);
+	}
+
+	device_init_wakeup(dev, true);
+	priv->dev = dev;
+
+	ret = priv_dts_init(priv);
+	if (ret)
+		return ret;
+
+	ret = rtc_init(priv);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, priv);
+	rtc_enable(priv);
+
+	priv->rdev = devm_rtc_device_register(dev, "s32g_rtc",
+					      &rtc_ops, THIS_MODULE);
+	if (IS_ERR_OR_NULL(priv->rdev)) {
+		dev_err(dev, "Error registering RTC device, err: %ld\n",
+			PTR_ERR(priv->rdev));
+		ret = PTR_ERR(priv->rdev);
+		goto disable_rtc;
+	}
+
+	ret = devm_request_irq(dev, priv->dt_irq_id,
+			       rtc_handler, 0, dev_name(dev), pdev);
+	if (ret) {
+		dev_err(&pdev->dev, "Request interrupt %d failed, error: %d\n",
+			priv->dt_irq_id, ret);
+		goto disable_rtc;
+	}
+
+	return 0;
+
+disable_rtc:
+	rtc_disable(priv);
+	return ret;
+}
+
+static void rtc_remove(struct platform_device *pdev)
+{
+	struct rtc_priv *priv = platform_get_drvdata(pdev);
+
+	rtc_disable(priv);
+}
+
+#ifdef CONFIG_PM_SLEEP
+static void enable_api_irq(struct device *dev, unsigned int enabled)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	u32 api_irq = RTCC_APIEN | RTCC_APIIE;
+	u32 rtcc;
+
+	rtcc = ioread32(priv->rtc_base + RTCC_OFFSET);
+	if (enabled)
+		rtcc |= api_irq;
+	else
+		rtcc &= ~api_irq;
+	iowrite32(rtcc, priv->rtc_base + RTCC_OFFSET);
+}
+
+static int adjust_dividers(u32 sec, struct rtc_priv *priv)
+{
+	u64 rtcval_max = U32_MAX;
+	u64 rtcval;
+
+	priv->div32 = 0;
+	priv->div512 = 0;
+
+	rtcval = sec * priv->rtc_hz;
+	if (rtcval < rtcval_max)
+		return 0;
+
+	if (rtcval / 32 < rtcval_max) {
+		priv->div32 = 1;
+		return 0;
+	}
+
+	if (rtcval / 512 < rtcval_max) {
+		priv->div512 = 1;
+		return 0;
+	}
+
+	if (rtcval / (512 * 32) < rtcval_max) {
+		priv->div32 = 1;
+		priv->div512 = 1;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int rtc_suspend(struct device *dev)
+{
+	struct rtc_priv *init_priv = dev_get_drvdata(dev);
+	struct rtc_priv priv;
+	long long base_sec;
+	int ret = 0;
+	u32 rtcval;
+	u32 sec;
+
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	/* Save last known timestamp before we switch clocks and reinit RTC */
+	ret = s32g_rtc_read_time(dev, &priv.base.tm);
+	if (ret)
+		return ret;
+
+	if (init_priv->clk_source == S32G_RTC_SOURCE_SIRC)
+		return 0;
+
+	/*
+	 * Use a local copy of the RTC control block to
+	 * avoid restoring it on resume path.
+	 */
+	memcpy(&priv, init_priv, sizeof(priv));
+
+	/* Switch to SIRC */
+	priv.clk_source = S32G_RTC_SOURCE_SIRC;
+
+	ret = get_time_left(dev, init_priv, &sec);
+	if (ret)
+		return ret;
+
+	/* Adjust for the number of seconds we'll be asleep */
+	base_sec = rtc_tm_to_time64(&init_priv->base.tm);
+	base_sec += sec;
+	rtc_time64_to_tm(base_sec, &init_priv->base.tm);
+
+	rtc_disable(&priv);
+
+	ret = adjust_dividers(sec, &priv);
+	if (ret) {
+		dev_err(dev, "Failed to adjust RTC dividers to match a %u seconds delay\n", sec);
+		return ret;
+	}
+
+	ret = rtc_init(&priv);
+	if (ret)
+		return ret;
+
+	ret = sec_to_rtcval(&priv, sec, &rtcval);
+	if (ret) {
+		dev_warn(dev, "Alarm is too far in the future\n");
+		return ret;
+	}
+
+	s32g_rtc_alarm_irq_enable(dev, 0);
+	enable_api_irq(dev, 1);
+	iowrite32(rtcval, priv.rtc_base + APIVAL_OFFSET);
+	iowrite32(0, priv.rtc_base + RTCVAL_OFFSET);
+
+	rtc_enable(&priv);
+
+	return ret;
+}
+
+static int rtc_resume(struct device *dev)
+{
+	struct rtc_priv *priv = dev_get_drvdata(dev);
+	int ret;
+
+	if (!device_may_wakeup(dev))
+		return 0;
+
+	/* Disable wake-up interrupts */
+	enable_api_irq(dev, 0);
+
+	/* Reinitialize the driver using the initial settings */
+	ret = rtc_init(priv);
+	if (ret)
+		return ret;
+
+	rtc_enable(priv);
+
+	/*
+	 * Now RTCCNT has just been reset, and is out of sync with priv->base;
+	 * reapply the saved time settings
+	 */
+	return s32g_rtc_set_time(dev, &priv->base.tm);
+}
+#endif /* CONFIG_PM_SLEEP */
+
+static const struct of_device_id rtc_dt_ids[] = {
+	{.compatible = "nxp,s32g-rtc" },
+	{ /* sentinel */ },
+};
+
+static SIMPLE_DEV_PM_OPS(rtc_pm_ops,
+			 rtc_suspend, rtc_resume);
+
+static struct platform_driver rtc_driver = {
+	.driver		= {
+		.name			= "s32g-rtc",
+		.pm				= &rtc_pm_ops,
+		.of_match_table = of_match_ptr(rtc_dt_ids),
+	},
+	.probe		= rtc_probe,
+	.remove_new	= rtc_remove,
+};
+module_platform_driver(rtc_driver);
+
+MODULE_AUTHOR("NXP");
+MODULE_DESCRIPTION("NXP RTC driver for S32G2/S32G3");
+MODULE_LICENSE("GPL");
-- 
2.45.2


