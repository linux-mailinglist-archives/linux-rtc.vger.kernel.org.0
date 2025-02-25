Return-Path: <linux-rtc+bounces-3265-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BC2A43F5D
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Feb 2025 13:26:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D4821899287
	for <lists+linux-rtc@lfdr.de>; Tue, 25 Feb 2025 12:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDE526770B;
	Tue, 25 Feb 2025 12:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MgZ1qVeM"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B17267AE8;
	Tue, 25 Feb 2025 12:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740486388; cv=none; b=BobQjnQFAIJahwVgB2UnFsDP4WhfBl8yLlNkh4pWBEdZGh0UhG0WHjVjJSKcC28jI+GIsvkAgM3NtGjv5hOgRbro7p1pJqxuqmY7kR1B2eCn4HZtBxmURM9UOy2KIWRUi9132yh4eA09CpceE7xStyTNbF5LRU770z9C5kEHE9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740486388; c=relaxed/simple;
	bh=aPaDn3HfERJVM/5TKH97CigEo7w3sFZnIJP1P+qN76s=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B0OsYhbxUyshVzfXXdhLALMNMQguyzFKw8J8C2xFHMNfm/DK+S+tIAh5d+VJWl9zEpyChhPKQAISSk1hE8e22oiaSnNQDtBdw9BZdYMphNkkEg9uFDOvFd3GbcUJto2Q8xEGRRAIsZMdXwdYwMX3egwnqXDGKveCo9Yg3bw/LXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MgZ1qVeM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8opm3017279;
	Tue, 25 Feb 2025 12:26:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0IHovyha28nioMj0jqE8NRML
	QetpUZ7DfOvIv8poExM=; b=MgZ1qVeMHziA3NjUeIktz0lRkFkt84zUSVCHzFOF
	ftahvEwnHUo2X9IQKvrYmUYKq3sE8TU0JCA6sPeVm88RZXGtSHmRhD5lZvYH1Ff4
	4nF2R+dLz9nVZaAG52/awz01r18ezkIee+LNcOj0v2QZOpVdOlmZzmsmWm0AkIvZ
	NNXDLNO/SSjrLJvCNQOfJ4iUFuckZZ/f56VbQdn4pQw1sQvgL/t2F0HcAaqfhzpS
	lgFULua2cNK+oIR/yu/22vWF0QwuKX1v1IhK6IUe4tTaKdmOnIP/+KbaHngfPkKV
	Oqzm4YX0K6OUhldPHDYAXG6GEj9lmKpJ6NZx7WOrFNQT4Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5k68y11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:26:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51PCQ1K8028313
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:26:01 GMT
Received: from PHILBER.na.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Feb 2025 04:25:56 -0800
Date: Tue, 25 Feb 2025 13:25:53 +0100
From: Peter Hilber <quic_philber@quicinc.com>
To: Simon Horman <horms@kernel.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
        Trilok Soni <quic_tsoni@quicinc.com>,
        Srivatsa Vaddagiri
	<quic_svaddagi@quicinc.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Eugenio
 =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Richard Cochran
	<richardcochran@gmail.com>,
        <linux-kernel@vger.kernel.org>, <virtualization@lists.linux.dev>,
        <netdev@vger.kernel.org>, David Woodhouse
	<dwmw2@infradead.org>,
        "Ridoux, Julien" <ridouxj@amazon.com>, Marc Zyngier
	<maz@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano
	<daniel.lezcano@linaro.org>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Parav Pandit <parav@nvidia.com>,
        "Matias
 Ezequiel Vara Larsen" <mvaralar@redhat.com>,
        Cornelia Huck
	<cohuck@redhat.com>, <virtio-dev@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH v5 1/4] virtio_rtc: Add module and driver core
Message-ID: <uj7g35pvelxwnukbkii6d7kzc4pjsj6wrtbcuomg3vhdluoxap@owoy3uy3xcrr>
References: <20250219193306.1045-1-quic_philber@quicinc.com>
 <20250219193306.1045-2-quic_philber@quicinc.com>
 <20250224175527.GF1615191@kernel.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250224175527.GF1615191@kernel.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OOjFz1sTOj6eqEabv-mV79KYBvcBXkId
X-Proofpoint-GUID: OOjFz1sTOj6eqEabv-mV79KYBvcBXkId
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250087

On Mon, Feb 24, 2025 at 05:55:27PM +0000, Simon Horman wrote:
> On Wed, Feb 19, 2025 at 08:32:56PM +0100, Peter Hilber wrote:
> 
> ...
> 
> > +/**
> > + * VIORTC_MSG() - extract message from message handle
> > + * @hdl: message handle
> > + *
> > + * Return: struct viortc_msg
> > + */
> > +#define VIORTC_MSG(hdl) ((hdl).msg)
> > +
> > +/**
> > + * VIORTC_MSG_INIT() - initialize message handle
> > + * @hdl: message handle
> > + * @viortc: device data (struct viortc_dev *)
> > + *
> > + * Context: Process context.
> > + * Return: 0 on success, -ENOMEM otherwise.
> > + */
> > +#define VIORTC_MSG_INIT(hdl, viortc)                                         \
> > +	({                                                                   \
> > +		typeof(hdl) *_hdl = &(hdl);                                  \
> > +									     \
> > +		_hdl->msg = viortc_msg_init((viortc), _hdl->msg_type,        \
> > +					    _hdl->req_size, _hdl->resp_cap); \
> > +		if (_hdl->msg) {                                             \
> > +			_hdl->req = _hdl->msg->req;                          \
> > +			_hdl->resp = _hdl->msg->resp;                        \
> > +		}                                                            \
> > +		_hdl->msg ? 0 : -ENOMEM;                                     \
> > +	})
> > +
> > +/**
> > + * VIORTC_MSG_WRITE() - write a request message field
> > + * @hdl: message handle
> > + * @dest_member: request message field name
> > + * @src_ptr: pointer to data of compatible type
> > + *
> > + * Writes the field in little-endian format.
> > + */
> > +#define VIORTC_MSG_WRITE(hdl, dest_member, src_ptr)                         \
> > +	do {                                                                \
> > +		typeof(hdl) _hdl = (hdl);                                   \
> > +		typeof(src_ptr) _src_ptr = (src_ptr);                       \
> > +									    \
> > +		/* Sanity check: must match the member's type */            \
> > +		typecheck(typeof(_hdl.req->dest_member), *_src_ptr);        \
> 
> Hi Peter,
> 
> FWIIW, this trips up sparse because from it's perspective
> there is an endianness mismatch between the two types.
> 

Thanks, I took a closer look and I think a virtio_le_to_cpu() inside the
typeof()s will both keep the sanity check working and keep sparse from
complaining - in the below case as well.

Peter

> > +									    \
> > +		_hdl.req->dest_member =                                     \
> > +			virtio_cpu_to_le(*_src_ptr, _hdl.req->dest_member); \
> > +	} while (0)
> > +
> > +/**
> > + * VIORTC_MSG_READ() - read from a response message field
> > + * @hdl: message handle
> > + * @src_member: response message field name
> > + * @dest_ptr: pointer to data of compatible type
> > + *
> > + * Converts from little-endian format and writes to dest_ptr.
> > + */
> > +#define VIORTC_MSG_READ(hdl, src_member, dest_ptr)                     \
> > +	do {                                                           \
> > +		typeof(dest_ptr) _dest_ptr = (dest_ptr);               \
> > +								       \
> > +		/* Sanity check: must match the member's type */       \
> > +		typecheck(typeof((hdl).resp->src_member), *_dest_ptr); \
> 
> Ditto.
> 
> > +								       \
> > +		*_dest_ptr = virtio_le_to_cpu((hdl).resp->src_member); \
> > +	} while (0)
> > +
> > +/*
> > + * read requests
> > + */
> 
> ...

