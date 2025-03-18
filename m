Return-Path: <linux-rtc+bounces-3545-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BA54A670E9
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Mar 2025 11:15:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FD38421AF3
	for <lists+linux-rtc@lfdr.de>; Tue, 18 Mar 2025 10:14:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 684CA207A27;
	Tue, 18 Mar 2025 10:14:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="JE1Q1JaG"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFBA1205AC1;
	Tue, 18 Mar 2025 10:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742292844; cv=none; b=DaaXqhZ1NA0rX7vTvLYaItlwfNMD8Osv5r0OFFe/BQVYFghByUUZHuCssC6ClIXzaMIY+0mNPmHGQJV4WwqwvzYYpQY4hqjj1qKGOuDhfxz+W3UB9f1Ty7n76THQhO/hvi1c0EiLFKsLzSy9De1xT4as9uLXhtbS/klpAYuSre0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742292844; c=relaxed/simple;
	bh=FX4cyBVUiAzeSPf8RPJP9YjElLpzhnZapb3umk3pBHU=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i022BMRyp0vnC3fQ0uWvm3pGTbQ2b/Gms+qCZBTezJWPIqu7MWyViZ7Cgm3wdAFh0exWBdbP8Ny5BfxIYTMVJ16YSf6/DWrur53StdSWOHY/CRJOd32zgsLhrhomMpPOuQGXFsaEtZSy/p14VqB4mamQjfbdLMAFQdPSRoIFZP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=JE1Q1JaG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I1950C027156;
	Tue, 18 Mar 2025 10:13:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jjWDZoORKIOqq8Zml1sJRSMh
	3yhKgNOhNoM65Pniax8=; b=JE1Q1JaGJjAZLmsWACXleDCjXY2dIXtZvMf3YpyI
	VRpJkhdOXs2h29zdIDg8Dyiu6s0vnWdgJ3ou0e6rGcjtruK/myjnCaUtyjmWUdgA
	8jT+pfV+/yQNuF7idNBFJsgYyv73O/SFQ3/34CP0K6AqRtr+ZN4kjZWd+D7U+PTy
	4nKOStzdK24sg10r8y0hwHV8c+YDFVSc5xz+ioiSRo5lHdQjIHNzDHf2L/ov2VM4
	hVjWI0h4854vzwaOM8fo8I0dF14+2TKvDuADpDhi5GIjzJnw+kaTB9YBV03M+BIc
	d5DmAW9HJF36ta3Bk7QO7B4OzjxxLWmuDBwgV5GfQtt3hQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwthchr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 10:13:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52IADUYt020637
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Mar 2025 10:13:30 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 18 Mar 2025 03:13:25 -0700
Date: Tue, 18 Mar 2025 11:13:22 +0100
From: Peter Hilber <quic_philber@quicinc.com>
To: Lei Yang <leiyang@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        <virtualization@lists.linux.dev>,
        David Woodhouse
	<dwmw2@infradead.org>,
        "Ridoux, Julien" <ridouxj@amazon.com>,
        Daniel Lezcano
	<daniel.lezcano@linaro.org>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Parav Pandit <parav@nvidia.com>,
        "Matias
 Ezequiel Vara Larsen" <mvaralar@redhat.com>,
        Cornelia Huck
	<cohuck@redhat.com>, Simon Horman <horms@kernel.org>,
        <virtio-dev@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>,
        <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v6 0/4] Add virtio_rtc module
Message-ID: <xogief67mb2wonb7angoypj4ddvvecyrcsnncqitggpij6ssim@fo3psnqqhovp>
References: <20250313173707.1492-1-quic_philber@quicinc.com>
 <CAPpAL=we6VkyBXBO2cBiszpGUP5f7QSioQbp6x3YoCqa9qUPRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAPpAL=we6VkyBXBO2cBiszpGUP5f7QSioQbp6x3YoCqa9qUPRQ@mail.gmail.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Mr7Thedl-QJOp0Aoc6AvPfrSkmEMvY8n
X-Proofpoint-ORIG-GUID: Mr7Thedl-QJOp0Aoc6AvPfrSkmEMvY8n
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67d9474a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=20KFwNOVAAAA:8 a=g3YzpIbaydEdkk7JLBIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_05,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=738
 phishscore=0 adultscore=0 clxscore=1011 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180074

On Tue, Mar 18, 2025 at 10:04:07AM +0800, Lei Yang wrote:
> QE tested this series of patches v6 with virtio-net regression tests,
> everything works fine.
> 
> Tested-by: Lei Yang <leiyang@redhat.com>
> 

Hi Lei,

thanks for the reply! However, I am not sure which virtio-net regression
tests you are referring to, and how these tests would be relevant to
virtio_rtc. The virtio_rtc driver does not have any relation to
virtio-net ATM. Reusing virtio_rtc within virtio-net has been discussed
in the past, but not done yet.

Best regards,

Peter

