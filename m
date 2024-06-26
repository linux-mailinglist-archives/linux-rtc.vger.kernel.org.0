Return-Path: <linux-rtc+bounces-1403-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2043B918701
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Jun 2024 18:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE6811F22BC4
	for <lists+linux-rtc@lfdr.de>; Wed, 26 Jun 2024 16:13:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 392FA19069D;
	Wed, 26 Jun 2024 16:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Gby6DzTp"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87A8190683;
	Wed, 26 Jun 2024 16:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719418235; cv=none; b=oIJ4shX3YdVwGXfG8uKI8iwpLf2s9n3nbI6rxmi3E43Y4KzCifmzhMtJnxdZQ3afiPeandi3Aix7YxWP5AN1OMiO9ZFg7a1TmBzwaYLdzYDcJjqMazvyxi4/wijtkl5/2criaDM4ShnRzCztL+hbamLLN6m6ZgHQJ6BkIPrLxKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719418235; c=relaxed/simple;
	bh=aIndTixJ42bGOiasp8WkfMSZOweNucO1CLgw1FWj9u4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=fMrNE3+aWKAjXIfn8hMIDnfWyZECzYRY8eZI/rXySIfgujFFL5ikxhfTXmD46leSkq4Y7H8lMYDQOwwY38BAC9oJwoR2vszCHrVrYcqoWqbmWHcflv3rVcSPcBGU335u1S8tDEoPoMktGTfi8npx5PYH6u1y6z3gpCRkLK8s6hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Gby6DzTp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45QAfiNW011470;
	Wed, 26 Jun 2024 16:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PHw+3vlikQh9ndjpcC7vSkz04PoLJsni0Tiu1ybIZ+k=; b=Gby6DzTpnbt9y7YS
	ZROnsBDFlyXHxXwxjHN7wR5xtmAWSf3p78ZCz2MjAuPFUI1Qw0qvhDP2eV2Mhsuw
	ry2ybVPB0bzAk01yG2AEAymehYSVOy4P+Qe4XtNa9NKSMgsibD148hMM1iwh0Tm0
	yKdwTg6xEpTP2i/TX+8KZDvN5Ps34J6lxPi5DAxvmNn+DctyplXYfTnvXFm1Lecu
	bN0iae9EmCDhxq50g4iNOw/mLIKdZ3DK2bCBPMk4M/kcb0ks+GHc+dWyBUhd/OgQ
	qq83vkhR1WmlCOw9dsz11igNyQ09nc5uWPlrO26AF8/TayCtRq6z2V7PM/JXEC5G
	eSdlFQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 400bdq9thv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 16:10:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45QGAR34016639
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jun 2024 16:10:27 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 26 Jun
 2024 09:10:26 -0700
Message-ID: <33171087-01da-445e-8125-e563b9abb471@quicinc.com>
Date: Wed, 26 Jun 2024 09:10:26 -0700
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rtc: add missing MODULE_DESCRIPTION() macro
Content-Language: en-US
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jiaxun Yang
	<jiaxun.yang@flygoat.com>
CC: <linux-rtc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
References: <20240608-md-drivers-rtc-v1-1-5f44222adfae@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240608-md-drivers-rtc-v1-1-5f44222adfae@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kx5tsLB9SbfBHNbXAL1epfYi4G58QuDv
X-Proofpoint-GUID: kx5tsLB9SbfBHNbXAL1epfYi4G58QuDv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-26_07,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=836
 adultscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 clxscore=1011 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2406260118

On 6/8/2024 10:52 PM, Jeff Johnson wrote:
> On x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/lib_test.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-goldfish.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-omap.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-rc5t583.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-tps65910.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/rtc/rtc-twl.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE(). This includes rtc-mpc5121.c,
> which does not produce a warning with the x86 allmodconfig since it is
> not built for x86, but it may cause this warning with Freescale PPC
> configurations.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

Following up to see if anything else is needed from me. Hoping to see this in
linux-next so I can remove it from my tracking spreadsheet :)

/jeff


