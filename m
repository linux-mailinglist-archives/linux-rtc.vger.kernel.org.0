Return-Path: <linux-rtc+bounces-3485-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D002AA606AC
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 01:48:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C566D460679
	for <lists+linux-rtc@lfdr.de>; Fri, 14 Mar 2025 00:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20696ADD;
	Fri, 14 Mar 2025 00:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b="dIRn+R1+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from omta034.useast.a.cloudfilter.net (omta034.useast.a.cloudfilter.net [44.202.169.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 452BDDF60
	for <linux-rtc@vger.kernel.org>; Fri, 14 Mar 2025 00:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.202.169.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741913288; cv=none; b=PpApIcxMe1aVAw0pji9gkzQedjDNHmevzZOKLVg/9rZrR8KgwB7CaFwRu9gj9kSRCqrrjBh3RF7XUnijDSLaniMgF5OE1LZ1PT+a1gEsMRz3hgS/Wi6EQs+aIjJsF2rmc204kqcpJMydvXYOKn4SSpyuEWlPGq+EweNRFYhqK2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741913288; c=relaxed/simple;
	bh=TQD3AJzqUtfxU2ZtBhJ0LHa7vvbXsj3A7BUF66xhl54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nfVhiUB0mA6GeBJAz6EH/zayhLef2QKmo31/pvPhS0fpr4zbQ/u+4qfbQaGW9RdEnQa8CUQOC/P92B0toxrHuqAAtFg2ZtWCl84Ibyr6wPvsChdaGHyuQYQtsOLfacX69gP4cWkj5HMT0s3wvk7G5GAC4XxKEgcmkl8xR/b6EKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com; spf=pass smtp.mailfrom=embeddedor.com; dkim=pass (2048-bit key) header.d=embeddedor.com header.i=@embeddedor.com header.b=dIRn+R1+; arc=none smtp.client-ip=44.202.169.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=embeddedor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=embeddedor.com
Received: from eig-obgw-6002a.ext.cloudfilter.net ([10.0.30.222])
	by cmsmtp with ESMTPS
	id skyathhr9XshwstDTt0AVF; Fri, 14 Mar 2025 00:48:00 +0000
Received: from gator4166.hostgator.com ([108.167.133.22])
	by cmsmtp with ESMTPS
	id stDSt3P3oPWBNstDStTN8p; Fri, 14 Mar 2025 00:47:58 +0000
X-Authority-Analysis: v=2.4 cv=A/+nPLWG c=1 sm=1 tr=0 ts=67d37cbe
 a=1YbLdUo/zbTtOZ3uB5T3HA==:117 a=6Vi/Wpy7sgpXGMLew8oZcg==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=7T7KSl7uo7wA:10 a=VwQbUJbxAAAA:8
 a=pCqRpgb2EoSYttADf5oA:9 a=QEXdDO2ut3YA:10 a=Xt_RvD8W3m28Mn_h3AK8:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ygi1TZ6kTOz8skaSiNhkQe8V1nGHCFg15P5UFWzKVtc=; b=dIRn+R1+T7USvNbetrG28jIkaJ
	AskPcM/0W8kW3KrF8bJDtUpJzXJEIk1hniRexG2VXo5MzhVGwcru0Jek7y5z6s28+ov7Zko3Y5sBZ
	SQcCYWVU+q8uuxzmfKJQYEd/ys2JwqAfCHZEcluR5gAPrhkw3fm0cbNq9gIkYJZLnckKZschBHLCG
	F5z2Rmg/18OfejD5EGOBHCC334f5l2tDbiGQWkAFPxe+v6a/xy1vAtbrowyC0WPpgyNDqjkSmHSFe
	/oc8OcxJdr7Vx1img6Gd5qvvCiTFNfc5Vt1xtBlOM+B9azal4g4SRXeDMI2KidIzLancF62/zFU1E
	OPx0RBGQ==;
Received: from [45.124.203.140] (port=53636 helo=[192.168.0.159])
	by gator4166.hostgator.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.98.1)
	(envelope-from <gustavo@embeddedor.com>)
	id 1tstDQ-00000003GmM-3ZZ4;
	Thu, 13 Mar 2025 19:47:57 -0500
Message-ID: <63d0cca7-b095-4762-8ec4-5004e5c6bad1@embeddedor.com>
Date: Fri, 14 Mar 2025 11:17:45 +1030
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] rtc: Avoid a couple of -Wflex-array-member-not-at-end
 warnings
To: Tzung-Bi Shih <tzungbi@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
 linux-rtc@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <Z851qvkycepdNlBd@kspp> <Z9EZByipsNmBoVea@google.com>
Content-Language: en-US
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
In-Reply-To: <Z9EZByipsNmBoVea@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 45.124.203.140
X-Source-L: No
X-Exim-ID: 1tstDQ-00000003GmM-3ZZ4
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([192.168.0.159]) [45.124.203.140]:53636
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 4
X-Org: HG=hgshared;ORG=hostgator;
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfIVoEE8fWoh6A/IxFspHThXbBEg9k6qLBWVwnvc4Xt0JFWyeDJm60UWB76oM9Bv7S1mKYC5c7kaGMqLWGqJ+AUUJo9Fnwi8tfyhx8GebfL7nBfSyJ/pM
 GD5RYQHUKVKcBvs6X7ZIiMwyFN8L4V1pOt7NeQbMzz40k+0rUDcMt0TSfHDSgWx7+KOMzhnT/jjap/LGdbr11WAWu5qkEgnYg38=


> I'm not a big fan of the solution.  How about using something similar to:
> 
> struct cros_ec_command *msg = kzalloc(sizeof(*msg) +
>                                        sizeof(struct ec_response_rtc), ...);
> 

Thanks for the feedback. :) We can actually use DEFINE_RAW_FLEX():

https://lore.kernel.org/linux-hardening/Z9N8BsVJF-s6Hcvd@kspp/

--
Gustavo


