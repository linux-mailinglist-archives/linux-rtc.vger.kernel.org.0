Return-Path: <linux-rtc+bounces-5829-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GoxCy11cWm3HAAAu9opvQ
	(envelope-from <linux-rtc+bounces-5829-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 01:54:05 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A710D601B0
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 01:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 500295E8F14
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 00:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329B53101BD;
	Thu, 22 Jan 2026 00:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UKyEptFu";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="JmDxtMHf"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812AA30FC2E
	for <linux-rtc@vger.kernel.org>; Thu, 22 Jan 2026 00:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769043187; cv=none; b=dSxDPF1JZyhCX+ufxHQogJ4+ZjQEVfWqJkeCnOZpmP+Oc5VWMfJ80d8zUcVqxvos5hBYl13IFVVW1dh1GGjPQUJl2aGkNlGURypD3bSUoyD5p1rgDEJEI71Dh1QQB18tIaSNjT615Qbss1Pg4LONLSF6ePPsSYq9LN5ipl19P3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769043187; c=relaxed/simple;
	bh=4o5lu0X8x3cz3e84g5Hu4E9AEmgeHTI+lU3tUjlxWOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pDJtOj6pajmBcbrxgAjBdU+lpYb2HqpVgwtzuOGpMvnxWgc0CesuyjPIxYeRgT6FPJ8qg1WmDvdwozGI17nrkbXL8dOAg2YvHjLDU1hPqS4T7hF5mqqvVqBwGLkXb0lQn1QQqnOjlMybfenP2fA668SqCvdX6q5Bw2fEuCkxNXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UKyEptFu; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=JmDxtMHf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769043183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BWIJc3/9ijl3mVCMGgR5Z1ZYcxb9ScXlgbIJwDk9hMg=;
	b=UKyEptFuAH8R/2SYqMUr+KIi1z7AwpYAy1TUYtb4OKZNWmdUGaHbaKY2HLTesaq6IT8qbN
	P8p0czcld4MP2YqgIm9uaQFYzMwvMuy1D+Ky/33afzJsojq1jQut7LFJRUoZpO+k1+Bdnl
	vMK95eFU/Omz1WBaFo8jV37lf7EGTzE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-384-seOZ1KXpMJCOtrp08DUZAg-1; Wed, 21 Jan 2026 19:53:00 -0500
X-MC-Unique: seOZ1KXpMJCOtrp08DUZAg-1
X-Mimecast-MFC-AGG-ID: seOZ1KXpMJCOtrp08DUZAg_1769043180
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89470bda22aso17345246d6.1
        for <linux-rtc@vger.kernel.org>; Wed, 21 Jan 2026 16:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769043180; x=1769647980; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWIJc3/9ijl3mVCMGgR5Z1ZYcxb9ScXlgbIJwDk9hMg=;
        b=JmDxtMHfxH4xLK65Wa00bOBvB47OkUHMR37tudY5pdyqIskrHKU6HSTFMd0AIH4yp+
         aN5aBZfQkh0pzHkPJsAnl+Frk6CDD+kJxbjP/rSQAoINVsmINtqXWQddgrRxCLpJw7gB
         dtd0j2Pr5vE6M7spPv+QTNwiTqBI/9oE8DxNhrEGVzsikTC8dZbVy1OiwtqtwBhESvRg
         kii3fXkl1orPNzR/hieYxxCHPJe8rMY7UuxRWQUUdamnDAd9Jxxch3PasWHkn8eUgPiA
         wK64dotxwAE/eMmrZ7Z0Do00RfPhBIB6V1g7YtCzZ3q5HC80IzdImFPmqqOSuV4oSRqI
         upOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769043180; x=1769647980;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BWIJc3/9ijl3mVCMGgR5Z1ZYcxb9ScXlgbIJwDk9hMg=;
        b=Bl3d3BbHhnH4MSAQHVV9Y5IbEWbegGqszQcOvmM1ZF8VbhKTI1PYMMy+42RwZKO4UI
         Vbd5RbN/SlCFd4DBHPCeW+2fASXghEgraN0pnXXCFgHJHDk/u6GhQJZ3eDu46UTINkxP
         4Vd44GHeVXFQ4h7htpkbEoeUgdMAHhh3H/3b6Bk9YBhHJlYoDjJPnb0tZMXh3KUEFduw
         +yy5+Dh4NpS3Abbl3/0p6MEWN4Bz5+TerX2HK0C7UGUN6oT31zumawglAG/ySUIEXj3J
         KHBOCzcG0I0CiNaWzIKQuSyqKNSK674YZ31Lt2QLNe69JkrCT1R0SK9ysql2IbP9nRgb
         u+uQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFRqWAXXixokSSdoeOiP+lV5AeZxBReqs9PZv60zFJhLr79dF9ei3s2SXbxQ7v+G6bXHqgNDAQB+c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbEOTUnQw0ma7YuTu69ou9KOYoLIxiaySscoLoCxFaRrMl3Eck
	/QozVFoPCN9Z4XV9qzXCu1TBfKorW/4Ttl5i5T8QPel8QbJhuAbABISVnnAbJH3WdFy6LcYJHYW
	E0kbac29SRlqkXX+nkk6icETWjRaoeP667CUqrJU+PpzIPGPIGk9VZmoF1L1Qiw==
X-Gm-Gg: AZuq6aJHpYFU2rGUoOtkPTHKMkqj+BwemwjHuMy7fePSvjK0MqEtHaT2+ql+1u7Va2Z
	AxVoDF3QJiHQx1HtsFWC6/uNY5KmbJ63Ouf9KDmRBn5CVP+3dxSq513n4upmbRjPl92NvxdnIW+
	cbhbC77H7BHiKMSbNWh2wEcnyyQAtTRiw6DW5TFWuFopTqguN142FYiN7wf0LjxtfXoRATv2Zzh
	SzYn4Cp9Sjx/HcAe65rDc9pR57sVfHhgeoX+LvqOS9xWYFrw3ZgNzqNFpn9Zz97qZaqxToO94Nf
	xvv1skgqLmG3T2EvraMwe9LkF+igLA/ewiKB7J3rsLB1sKFRau6MnDzQPJvi26C8TJZOtBUNSf6
	fzOy4Dh/KjIoi7jeaZ5aScMNlXqlDM0Wi0ldCXeaevy3R
X-Received: by 2002:a05:6214:d68:b0:88f:ccba:8f20 with SMTP id 6a1803df08f44-8942dd8c52cmr260833186d6.48.1769043180243;
        Wed, 21 Jan 2026 16:53:00 -0800 (PST)
X-Received: by 2002:a05:6214:d68:b0:88f:ccba:8f20 with SMTP id 6a1803df08f44-8942dd8c52cmr260833026d6.48.1769043179828;
        Wed, 21 Jan 2026 16:52:59 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71d8314sm1354117985a.24.2026.01.21.16.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 16:52:59 -0800 (PST)
Date: Wed, 21 Jan 2026 19:52:57 -0500
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: Re: [GIT PULL] clk: remove deprecated API divider_round_rate() and
 friends for v6.20
Message-ID: <aXF06fjOQcj6mDNF@redhat.com>
References: <aXFYU324yQ6uBmk0@redhat.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXFYU324yQ6uBmk0@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[redhat.com,quarantine];
	DKIM_TRACE(0.00)[redhat.com:+];
	TAGGED_FROM(0.00)[bounces-5829-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-rtc@vger.kernel.org];
	RCPT_COUNT_FIVE(0.00)[5];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns]
X-Rspamd-Queue-Id: A710D601B0
X-Rspamd-Action: no action

Hi Stephen,

On Wed, Jan 21, 2026 at 05:50:59PM -0500, Brian Masney wrote:
> Here's a PULL for this large series that continues the work to remove
> some deprecated round_rate APIs. I used the following b4 command to
> collect up this series:
> 
>     b4 am --cherry-pick 1-13,17-23 \
>         20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com
> 
> I skipped some of the patches that have already been picked up by
> others. The last two patches in that series that actually remove the
> deprecated functions will need to go in during the next dev cycle.
> 
> One thing that I want to call out in this pull is the change to
> drivers/rtc/rtc-ac100.c, which is all clk related.

Alexandre requested a minor change with the rtc patch, so I'll send you
a v2 pull tomorrow without that.

Brian


