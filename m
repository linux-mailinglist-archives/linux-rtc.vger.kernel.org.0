Return-Path: <linux-rtc+bounces-6223-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJimCcgcuGlYZAEAu9opvQ
	(envelope-from <linux-rtc+bounces-6223-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 16:07:52 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9440C29C007
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 16:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BA2B530263E7
	for <lists+linux-rtc@lfdr.de>; Mon, 16 Mar 2026 15:03:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424D0315D30;
	Mon, 16 Mar 2026 15:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="onzAdZk5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SgqSjWcS"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E9631283A
	for <linux-rtc@vger.kernel.org>; Mon, 16 Mar 2026 15:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773673421; cv=none; b=kIomRXuacYMmTRIKOzL6sR1hFg+BwBZ/EpL7os5xR1TDgDvVKb0gCu8V+xMTZAILyJE5f+8pkQJeZvXZSugb2pB1Uz6zrDSYMg41nXiw0ySNBLPj0exE3a92RFVlPSqUCPocrPQTD6XQmnoCL0S5Ps3wR0LmpulAgu/LYkF9xEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773673421; c=relaxed/simple;
	bh=EZNWj67TxgIq1VE+4I4fSpVFm88t6C/a3QFfd4xpnAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uZcYrIk/I0qyrgEA94eCPEYYRfMOkShVYSITk3U07ASs6OZlMWNngypIO5dplNsB6E+0ckvADhQKSMxY3lmxjHXGJ4FicjKlKLdDfzLlWL+p3ZTj/am7qGYVozd5UosPyV8uiGnlDskyj/nfT+3mLWs2YtRSkPwxnoLPVwaY3K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=onzAdZk5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SgqSjWcS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GC3ZFS2673271
	for <linux-rtc@vger.kernel.org>; Mon, 16 Mar 2026 15:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aCODfBGAeL0cibHdox9jxkGJAyfhaMDkIMYHx4tRmBs=; b=onzAdZk53HGPQGyk
	0CSTfd5m9dkxInOz4bsfgnWhW/ENpD8gR7TExcvI9R0u5gFhbRnQvOkLiOOy9hyX
	j7Rq66Rhej5PgO2H9TR8sosME3vdFqDbEXpXhJsLE4gg55i7XwPp/UdXKBjbXsMU
	yjkkhTcQ7qw8XRhECISMAiZZU3YYD4LSdKNwtfGHGIabjGJ3j7qmIBKKiNWQfXjl
	WGht/XV7VNX6yhDYactTSVnDe4YmJEMhTfpIz6nmfZlJkWovtEqlIzkNFyusXLCq
	Nxh4gZ1/vEmsFtBHHKG9t5LPyvYwmBjFaxyG7SeKE72tipNH/sAr25xxNNDrAAyW
	RozcAw==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw03xpba3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-rtc@vger.kernel.org>; Mon, 16 Mar 2026 15:03:38 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d74d78c5f7so52311753a34.1
        for <linux-rtc@vger.kernel.org>; Mon, 16 Mar 2026 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773673418; x=1774278218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aCODfBGAeL0cibHdox9jxkGJAyfhaMDkIMYHx4tRmBs=;
        b=SgqSjWcStXtCEk1kMDHHwHpBppQGbcz8JIS0pgn1XuY+S7EuVBW35PPI0ZAi9W/x3X
         u5EYxW1LE4x6SYECfHU65eldlJXCGkQCvSN4DFpr96Ht2+p7qgXkQURbf3VnB+23QBWq
         IAJlD8aRSicg9ROkTsfZ0Xo+ViZq14alQ/8IGFl3KXX6e190G1ThppBau36Qp8n57VnO
         U6GCy1Cj2vgd6VlDBKZ8GQQb8pF2huRmqoZiusAGjeJQtLHHI5zXRqwKCCtxvkZceae8
         2RCuvTguOVJ4BC+BzUiHfM8BxmrG1LEhmWoKJtQiw3KnFxtTaRqDB9yXiPdGMVSCID+V
         yXLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773673418; x=1774278218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aCODfBGAeL0cibHdox9jxkGJAyfhaMDkIMYHx4tRmBs=;
        b=FgYJzqr0DKPWKBUixMSZaG1vkxw5y8xOVYyOSZ7qsMnjaSm4RCh9y9H8O1dLRLlm05
         Ne4/g4sQ3UUiO+VIZ62i5MzlWPy7Jxel2kYccxdn0pTlz38tTNZDaMoYvlyIjNeGb0fY
         cIcEGpwCKtBV97cHEnFqyOOmoj1hjp33Pdxh6uoNo6VhIAGSGzilXSAF/yRTfdzAfUTR
         +8bGOLm/4n/OkAmypk9K3vNfwnRGqmMFCpMkSfciV1Zc8Hmn3iAv4fixPTlqHh8qh3EJ
         3Z30uat29LCm9btElJLVdKjHmaCa8t68cAoosX45nAkbwuraN6NNvlSzSTS6b8g3WcTg
         ptrw==
X-Forwarded-Encrypted: i=1; AJvYcCXPORtvw+/QV+bai+UpmYk3KX0cMN9B+Xm4lV33G52fSyGdejvxBZOkxIIi/vJEw1kJIZsPrffWwTA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIuv+JcyQIHx7GMvlNVT9KxtB+Vqyn4z1w9eDuZvjf1lOTwLvb
	ZqZbZrBARBfgR3klPQrgBVxsri5QYlEHxswSsnksS3hMB6rH5/KYmbGA6oXLNoBv6TnqRDffPUA
	xK9rCJ7swnQRNilaeJKDLn7zpVfmQndu99MfaTRz0AEaFIiTYLuC1TQE04zXV3n4=
X-Gm-Gg: ATEYQzykaBDl13D4MiH5K7ighp68+R9JqPMW5ZyfrMuqNBinisHMggAf29oHY0VJNkA
	wOF7eCQWlDmRPe0MKNsrB/yLzioRQjWWdd63pQS7bUm4OHl9DzsT5SLry5zuyYp0wkc2EoSbiIw
	3/K0iDgVlGs76BCjjrW+Rd+w9oFfYtG7FyleSBNRJBRqn8tg66O0XyzvhMua9DY4oudtu6DmK2j
	RQ52LAugzofJX0NUaZd7kpP8u9KI3RPyMITxEm13ODDxV94U70GEsj+6fCryBsOtuo1q5T1sIyw
	LhUGT2nRaCTpwdPplgYk2OZ7T7+LALb9c6fRdvpRcKI4NJQMbmahfQssgk18GZT6QSZH78nhJUs
	couiATHx5Ei2kKWurrBb4qIeoSVkty2TBo37twrUpXv534Z0Jy1K6z2/WqbqZArZTpozlhdm333
	fWyCEHMXwn
X-Received: by 2002:a05:6830:8217:b0:7cf:cbff:85e6 with SMTP id 46e09a7af769-7d776c64ff8mr9921411a34.12.1773673418349;
        Mon, 16 Mar 2026 08:03:38 -0700 (PDT)
X-Received: by 2002:a05:6830:8217:b0:7cf:cbff:85e6 with SMTP id 46e09a7af769-7d776c64ff8mr9921381a34.12.1773673417911;
        Mon, 16 Mar 2026 08:03:37 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:5dfc:3995:22ce:d286? ([2a05:6e02:1041:c10:5dfc:3995:22ce:d286])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855725572csm192675105e9.2.2026.03.16.08.03.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 08:03:37 -0700 (PDT)
Message-ID: <e3b1fedd-79a3-41be-a94e-a08ad0c85b66@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 16:03:36 +0100
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] dt-bindings: mfd: max77620: convert to DT schema
To: Svyatoslav Ryhel <clamor95@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20260312085258.11431-1-clamor95@gmail.com>
 <20260312085258.11431-4-clamor95@gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260312085258.11431-4-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDExMiBTYWx0ZWRfXw/h41WL32x5N
 ySGL8e6+EGSbKzsDKgq7oA6iMZvxfcFWyVjRlelYzzArEa/V39tk7vBng0PWafmU7phkB5wWV8G
 KcR8Rd4o4LRO9VHG6vYB0pR335lvsNlEX/6YyadjOn/hfizKLP/ldlwknPMGToMHitHz/kljJEA
 dEIG5OvBd+GKfcRfZ31jcm6IIIfk/cywiXdvAvJY8k+iRLO4iZs4+vfhxzhrXa/oSBU9jMhOctQ
 BD3Xw4yOYggFubUwyHAywydlO7uJkmobh7CKc+NbwQog/09akHGqGR+j0U/KRfQAVA+16VdOT+T
 16wYzh6sVU4ALjRYTXrAuYxMWSY2CYUcM3FkIh+rnAilAy+YzeqkcqOQUDsukgnmwG7BKX6XT4x
 t0Nj+wFXXZ5R3gUb9/hkXbZ6ZrZfLJGwgmQDbpSCtlCC+rdfEAstwxXZDwXoY43nK33K1Kdlvaw
 nV9fbv6XIpDYj1bI3lg==
X-Authority-Analysis: v=2.4 cv=YLOSCBGx c=1 sm=1 tr=0 ts=69b81bca cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=VwQbUJbxAAAA:8 a=3ki_b_XlgFUerp_oe5YA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-ORIG-GUID: cKepTBQjmUx3Y93cDyC4JsQBmosiOnGK
X-Proofpoint-GUID: cKepTBQjmUx3Y93cDyC4JsQBmosiOnGK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1011 priorityscore=1501 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160112
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6223-lists,linux-rtc=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,intel.com,arm.com,samsung.com,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel.lezcano@oss.qualcomm.com,linux-rtc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9440C29C007
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 09:52, Svyatoslav Ryhel wrote:
> Convert max77620 devicetree bindings from TXT to YAML format. This patch
> does not change any functionality; the bindings remain the same. The
> thermal bindings are incorporated into the binding. GPIO controller
> function in MAX77620 has no dedicated node and is folded into the parent
> node itself.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---

For the thermal part:

Acked-by: Daniel Lezcano <daniel.lezcano@kernel.org>

