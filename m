Return-Path: <linux-rtc+bounces-3906-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1F1A83CD0
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 10:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B4A8169E09
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Apr 2025 08:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71E1A1F1306;
	Thu, 10 Apr 2025 08:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fh8hJmia"
X-Original-To: linux-rtc@vger.kernel.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on2051.outbound.protection.outlook.com [40.107.241.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD0D20AF73;
	Thu, 10 Apr 2025 08:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.241.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744273564; cv=fail; b=ofiulAAKzaVAQXq1fTJr3USxy6SmGY6tLJX9+ZaUj9zSdOEFkDdvH6V/arAUznno19N3zfT3H5haag8A8PzYP5VOh5nvaHW7F+BYr0Q/Y4Iw9qKjSF1D2LXWVkhN0UX9UkBff8NSLQBpHIdyNd0xgNCxeVYpEMgC92B0OHZqaFM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744273564; c=relaxed/simple;
	bh=rtDP+q3oSxJTACZ8X6P6hpNII6VRGTtDXEUS1KET+2Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OB3D6/IvqmfGxRWgmRwkRvhKnRhWG/HVuopc7bO5plM4G6jUZnNy5+cgMUnuVAVTRDZBqp4HzsQY4YwHrzZpt7K4wIOr343ASi3cZ3hSrKkXiknFN1OEXOij1+CWh8i4tiz+CHuP5SYITO3QH8CynB++ioHTl4pQD8Q/eov/Fow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fh8hJmia; arc=fail smtp.client-ip=40.107.241.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pZpitpfV/kCC3qhs/yygOgNr2B5wYUVSk4TBztczet4fyQN9CPb8YVjTB+oXC6TxirCKfoh4En1Ydg4q+2wMIK5nuvDmq2AUPQL9NzG5zHuh/xJ/w5pM4vVIIfAgf57SgD6/Prrbxfn4gxo8Lxye0bkJY9sZoig8go8zQEDEKRxzMuEt5BLkYUbC9SK+qZz6MYvxXadbAFHvyj9M6ezsuoDe/6pxCu4/7n4hRHN3ixjirbhIZ5cD6hT94t5EzUMNTlDp0MMim9ZSNXw1+Is04xKUTIX0Pat+SrACoZ9Ku85ntNjyVXgM3qfYl/f7mIfcME02P4Cw+sDilwgJ50rYNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OVPQi7wRoh/sfZHT3FH56+4ubgbxw+Z+gdwDPTfhN0=;
 b=GETdwla73HkkbKfHL2A2/XP5AQOoMOXcXTVr11rbvQ2D0ET/6Z3H58sG98vsd9wuvfzLvaFGs7SSjdQwnhvTkMbWJ7DOBB4SGFkwcYFjRcMVMek76mrFa2taN4FiPB6aLXmiZejBFXbumgoMDCP7Co3YIHHRooOmCfXGK3OGD8BMruPZKoTl1QIWyJIG72rFE4jBzmAI29XT91Xw5GS/6AxFjPKJkmQGeY4hyjm/W/j1IEQ0Sbc8WSQruK7kpVTv9GmrHEyAkvB7RMT8rVSWsm6HZOW9rvf3S2wnvX1E8pqzkhMZ+M4otXgOfHj4xqlrb3kyo5rjHL1qyztZ4bUGqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OVPQi7wRoh/sfZHT3FH56+4ubgbxw+Z+gdwDPTfhN0=;
 b=fh8hJmiaILwEtlUDB3K5Ma6ztUD+WtmPfpsQ0RR/23UgR1iPbpPzKE45fnica3HD2NrqtWpTzzNdJRTlLtk3ve9hDtaDTtnp6Og1nxJg2/5YfVcwazB+JGtnwoLWh1v/rMegAmziIJMSLHAL824dUmVSrlHLbGRVmWGlQiwMzBEBfLgc2jny9iJREw8/O7Cu5WLK3r5S6wPkUIAo+uhV7Y8UcXt141Nag2Y6qQ90IAeAbu6rfeDVluHAs9YAjf1uDidDPjj0IJPYz6sl/f7iHHOJta3pEozYMGIBIkQr+ykXbhuAXAHRJQ59mI/c2h0MqQCgC+ad1e5yQHFI+S73Og==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com (2603:10a6:10:352::15)
 by AM9PR04MB8858.eurprd04.prod.outlook.com (2603:10a6:20b:409::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.23; Thu, 10 Apr
 2025 08:25:56 +0000
Received: from DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd]) by DU0PR04MB9251.eurprd04.prod.outlook.com
 ([fe80::708f:69ee:15df:6ebd%4]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 08:25:56 +0000
From: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	s32@nxp.com,
	imx@lists.linux.dev,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>
Subject: [PATCH 2/2] rtc: pcf85063: handle stopped oscillator at startup
Date: Thu, 10 Apr 2025 11:25:48 +0300
Message-ID: <20250410082548.3821228-3-ciprianmarian.costea@oss.nxp.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250410082548.3821228-1-ciprianmarian.costea@oss.nxp.com>
References: <20250410082548.3821228-1-ciprianmarian.costea@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM0PR02CA0222.eurprd02.prod.outlook.com
 (2603:10a6:20b:28f::29) To DU0PR04MB9251.eurprd04.prod.outlook.com
 (2603:10a6:10:352::15)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR04MB9251:EE_|AM9PR04MB8858:EE_
X-MS-Office365-Filtering-Correlation-Id: eb335c31-39c0-4f09-f71b-08dd780950a1
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bTIyZVlWeGJud0ZkUklzMUs3SDRvOWVsWm5BWDBmLzZPOVUxVEM1Z1g2d3Fm?=
 =?utf-8?B?dk1VTlJoS3U2akZEUnV5Q3dCTDJTS1ZxaVFjSTA3UmdIcjVCMVNSZk02NnlJ?=
 =?utf-8?B?QTZPTitwd29DTERPdW02dmRJM3doekwzc1QxdnVqNk05Q3pMT2lCYU1WRTNQ?=
 =?utf-8?B?Rnh0UWNzdFE3c29ZTjBWN0lENjJZS0EvMlAra0tnUUN3ajhDRk5mUGdNK3M1?=
 =?utf-8?B?dXAxTWkzUVBXU0lxWDRUOXQrQWZVK1NmRytwMWNNYnpKbW9zVnpDU1ZheUlo?=
 =?utf-8?B?QzNFME12UVFFWE5HQzdPdkYrZWwreG5ZWWROa25KNjN5VVZJZ1IxODBaZVgz?=
 =?utf-8?B?TFJaVm5jeWliNlpSd1ErSVIrTnlPajNaa0R1WUlZaTdRNnJoaTFlWjltRmE4?=
 =?utf-8?B?YXNFTE9lbHhOanovRUlHazBldVFlZ2RFRWtDT29heEpzZWpzaE9ldXAwR2h6?=
 =?utf-8?B?dmJpcGF5ZDdwdGMxTksrN1RKbE1qcllHMUxCdENnUi9KSzFvcUplR3ZIbWFy?=
 =?utf-8?B?OW5GK3lybGFEaUtDWmluUkY0ZDExWDVPSEdzcm9kU2RnenRpbDlZWWtQMlBx?=
 =?utf-8?B?bThvYzlOaTl3RkdXWEY4aFpIczlSMHg2ZEV6c1hCOWl3dUVyYzQ5YkdvNWpF?=
 =?utf-8?B?TEdjQlJ4UjQzT0VDVVBOOXFNeWwrblJqMnBUSlJ6czZSNjExUUx0anZwZGpD?=
 =?utf-8?B?b09ibGVZQjQ4NVNmT3BhK282N2pZSDdJR0dPVmhENkU5aGlRT3Z4VEdkaGJV?=
 =?utf-8?B?K3JDT0RvYVBNKzZkSDVnZTZLVzRCOGxNcFg3QmFKdGxmRkQ4MEZnNXErZ0hs?=
 =?utf-8?B?bTJCMTVLZlVDc3Y1VDdnQUh3NjZieUYwdmpiME5hV3crY3oxQ0RVZE1EY1FZ?=
 =?utf-8?B?N2M2Y1ZvM2E5NitwUWQrbXI5ZG9wak5FajFhL2d4ditkSkwweHJKRzMwazNn?=
 =?utf-8?B?ZWkzY3VER3Zjc2xCUWhxYWFiWEYzT04wTndjdVhDbEZnWWx6NURxTXhtWWpO?=
 =?utf-8?B?b0xYV1piUHo3OGNaV0RRKzVxRStJemFHZXJJUzZsY2dCQ1U2b1pyVVg5TWwx?=
 =?utf-8?B?dnQ0NWJzeWovOWh5dFVvUDVpdFgyYjNYRXgzUG1ic1g3UHdqczNrdkI2N3RR?=
 =?utf-8?B?dFlidTlYRDF3Z2F0aG1aUHJoQkZyNUtYRG1ndHdSdXM2ckpKcXdJOUNOeVB4?=
 =?utf-8?B?anhkOGNEejZubWFqbVVFaGFiekF6OE8xYjd4SlNZNzdjcCtEaEtHNzRJWWpZ?=
 =?utf-8?B?YWU2ZGxjcXlsSkRSUUdrZC92b1VNT2haTzRhT0svZlp5QUpVeEM2dVcvNDk0?=
 =?utf-8?B?TTltMzVrdG1JNkM4WFBmZFpvVXQ2TGVycGZBWXRhUHJsWGlBc3J4UVEzNHZn?=
 =?utf-8?B?NHRtQzNTZTV0a3lsSnpxTFd1bTNmZzBHZVRGWVp2Umd4Q0hwU3E1TDVPSzFQ?=
 =?utf-8?B?V082ZG93aFdidEJzZnozdHNNZmIzTFdYVWhRSzgySHJwRGZiMEhpZGtKR1Nm?=
 =?utf-8?B?Z1Q5bEU5dnh4VkQ5NTV6dVhWbHpuRHJqaktKVVkvUkdBSzNzdEVQQWhoUGVx?=
 =?utf-8?B?aXBTK0paOTZVb2N5NmloNDE5b3NkYUtCaEZXY21WSlRVQXM5eGlsS0VMKzZl?=
 =?utf-8?B?c0pBYThZclVIcVk0cUt6QndMakhobFlrWkQrMXh4RDdEYzFjYk4yRHN0ZXlY?=
 =?utf-8?B?VHEzL0hCbElmOEM5b2ZiQ2V2WmlCZjdiRU9JR0tkc2tZK0c2Z1FnNXIyS1VP?=
 =?utf-8?B?dVhpS0hmVGk4RGptYXRjcDN3Qmx1NTVtWE1lZXdIMlE3d1pibHlyellNRDFu?=
 =?utf-8?B?aGhvVHFCYzFRdnJwYjBETHQzQWdNRXdIOEFhcEI2WXA5MitRR1pjQ1dOMHlz?=
 =?utf-8?Q?xAkk5KcLlW0pp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9251.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGNJM090T0VZY3ZiKytTMXZ6emllMUZ5V2Q4TTN0ay9zWXR2Uk9xTkdzMmxG?=
 =?utf-8?B?R05wcVpMVnBpUmI5NUVuMm5RdkR1YVF3VzhudklDSjNhV09MTDgxNDFUOXp6?=
 =?utf-8?B?M3hQbWZLcXl1TmwwVlVhUmNKQlRQbXhEUnBGalo1WVNoSTZBSzA0WGlYYzN1?=
 =?utf-8?B?dkQ1RHlIc0FhV0s1WWdvOFRaRG81U3pvQTBvVkN6SHh6NkttN2VmSmUyOTM2?=
 =?utf-8?B?T1hnTmZVcFJERWJaeTNhN3I5a2NGdHAxWVVWaktBTTlOTS9kbDhibGg1NjVy?=
 =?utf-8?B?bUYwTmJEMlQ2eC9uVkhuOEd1czJzVFZXbjRkaVVITWorMmhwSTM5aE94MW5q?=
 =?utf-8?B?ZW1VWERhaG85ajIvUUlmMkRBK09ReHpxYnFEaHpvaTB2SUVVWXFyT2lHalpx?=
 =?utf-8?B?Wlp6cnlxbkNuUGxqZ2pZdmhRWEEwcHgzVWdNZ1NpMHE0TVlPTnNKbm4rN2Nt?=
 =?utf-8?B?RktUL1lOMnNYalcyUklXMWpndVdSWEFMcWlCZlNjZjA5MHhXSGpidTdRZ2M5?=
 =?utf-8?B?WmppQU9ubTJKWW13UVc0bk5ORUhqVmxjSmZWQXlwOVdvdnJKRkJSQWowUi8r?=
 =?utf-8?B?T2E4OGRScHd5anFaVEw3YkNDb2dEOEhBRjIyN1hMNDNoRTVXQjUvbHBBZ2x4?=
 =?utf-8?B?UzJnZzMzbzVFQVVUZiszdHFLSm5ibnBDVndESm9oaWNJZGIybVBoTXFMbHUv?=
 =?utf-8?B?SnREM0JYUXV1eVhjUTljWFdtV2lPVnJRZHZBM1FPb3BFVzZQaEZJelNCWHdE?=
 =?utf-8?B?NEZ0RGJqVk1nQ1dFeS9uODBRQ1czaFV3c2VPZy9UWmZJZUt3dmNHdTlnNHVh?=
 =?utf-8?B?ZXNYMCtvSDYwMkZLSWJ5MVFTb2JDKzd3WE9Db1J1bDVLeFl4QjhXdThOTUxI?=
 =?utf-8?B?d1lrNnJ6Y0ZqYmZDTkhxSm54Nk9BOFd6dkg2M3ZPM3VPU2VNeXFFZzMrVzBL?=
 =?utf-8?B?VjBIeEcyZDczQjZVeG9iYU5ZeW9ERytPRVFLdXNIR3N5TU9mR0hsaFZTTWE0?=
 =?utf-8?B?R3Y1K2QrZ2JkTGsxOXh1ZW16MzEzckdvSzloejEwNnQwNFZ6RzE5cWFTdUFo?=
 =?utf-8?B?WXJUdytnU3FIb2NZQnpkQUNBV2hLbnh6cTBVTytZSFp0aW5Ma0hMTjBST3Fl?=
 =?utf-8?B?NWM1Tm81R0FNWC9XQk9aZjZ3eXRQSWdUWW5iWXB1aWZ5SXdaTXNOYStPM0NE?=
 =?utf-8?B?UXNGRGVxVUtTTGxaN3o3d0xMTTJURXpGUHBVOGpkTEM5MUFjZmx0MWxHMFVE?=
 =?utf-8?B?bnlac0tZdjBtQXNZdFN0N2s5eDV3cXVaOGZ1UjVqNFN1M01BWEQ1NVhaOWlZ?=
 =?utf-8?B?RHJJcE5zWk0zSDBFd0RTSTQ0dmV2SS83WFhuTWZUZ0xub1NUdUpPcGpyVm44?=
 =?utf-8?B?KzN4UERHREJnOGp1OWNsYnE0RFZSZkxMS3MwdE8yYzNkT1ljMm9yK0ZrMG9C?=
 =?utf-8?B?VzJKaXJ3TDYvbzJCdnZPNzMzQk5CRU9GdGdvUmtmUW5Fb0pHKzg5Yng2a3Zl?=
 =?utf-8?B?NTFtdDhOa2U0T0VsaHl3b3Y4Z2JIZURLWlZySStvUWRnN2RlckJYZ0hvMkJ2?=
 =?utf-8?B?Y3JCaDlZNkFuUlJ6ZnBMVzhpY1o4K2E4UU1UenNBdlc4V1hNc3ZTZm1uNS83?=
 =?utf-8?B?bWR6dU1SSDFDWldzVHI3YUpLRENqaUNyM0tIa0JsaVVSdmk4WXg3NFBmOW1m?=
 =?utf-8?B?T0puZWRWRlJCOHVUUmlUS1pYaHgvakZzamFpVlI2Q2FlOXQ2M0lxYnhvS0hp?=
 =?utf-8?B?Tlp2SHdndGdsdjhabnY4ZXJDQU1HNkhaN2RqelFRN1lXbkFwMGtLTzhEeWJw?=
 =?utf-8?B?MytWWExlS1NkYVhET0hJNmdXTDFFejFtdTAzL3hpSXk1WWFkTFh5bk5LdXl0?=
 =?utf-8?B?MmNYQ1JMdzZlem1GRDc1bUE4Qk5PcHhnNyt4eHV6bE5JYnVVVGdSWCs5b3p5?=
 =?utf-8?B?azNVY1FrUGo5M0lkY2JueGlBaHd6WnowQUhUUWJyc2ZQd1g2VjdVTDZnbGls?=
 =?utf-8?B?WWFyOGk0S1ZTZlZQSXh3M0FibTIwQS85OWlrc1hJYTJjODNYUEtHYll0RWo3?=
 =?utf-8?B?Ukd5M05EK0cvaVpUeGpUSXJXQURPZCtnemVYUnorRU1kaXNXOENiN1lFZGZS?=
 =?utf-8?B?Mld2Z2xFdHJ5YmlPY0wra3p3eUFMcVg3cmJWeVZITzlxRmlwVG5lSnVrVzVX?=
 =?utf-8?B?M0E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb335c31-39c0-4f09-f71b-08dd780950a1
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9251.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:25:56.1153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GXt4ULHjqTqjwPkrZXV4PZPfQ9Vp18x6HuhvCWWAJtyAMteO8+LAbsPn6HtDdnWlMmuFJlowVao6SnQqwRYaeT89vpkxpXmmXt9duvGMA3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8858

From: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>

If the RTC is not linked to any battery, the oscillator is stopped at
startup and a SW reset command is generated to the PCF85063 RTC.
Manually start the oscillator in case the PCF85063 RTC is not battery
backed.

Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@oss.nxp.com>
---
 drivers/rtc/rtc-pcf85063.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/rtc/rtc-pcf85063.c b/drivers/rtc/rtc-pcf85063.c
index 4fa5c4ecdd5a..6de7344d2469 100644
--- a/drivers/rtc/rtc-pcf85063.c
+++ b/drivers/rtc/rtc-pcf85063.c
@@ -590,6 +590,14 @@ static int pcf85063_probe(struct i2c_client *client)
 
 	i2c_set_clientdata(client, pcf85063);
 
+	if (of_property_read_bool(client->dev.of_node, "no-battery")) {
+		err = regmap_update_bits(pcf85063->regmap, PCF85063_REG_SC,
+					 PCF85063_REG_SC_OS, 0);
+		if (err)
+			return dev_err_probe(&client->dev, err,
+					"Failed to start the oscillator\n");
+	}
+
 	err = regmap_read(pcf85063->regmap, PCF85063_REG_SC, &tmp);
 	if (err)
 		return dev_err_probe(&client->dev, err, "RTC chip is not present\n");
-- 
2.45.2


