Return-Path: <linux-rtc+bounces-5825-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LBoF3pYcWkNEwAAu9opvQ
	(envelope-from <linux-rtc+bounces-5825-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 23:51:38 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7E75F14E
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 23:51:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 574F34F96D4
	for <lists+linux-rtc@lfdr.de>; Wed, 21 Jan 2026 22:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CC1E423A80;
	Wed, 21 Jan 2026 22:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DZgQ9U0+";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="lGivQTIj"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A60030B52A
	for <linux-rtc@vger.kernel.org>; Wed, 21 Jan 2026 22:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769035874; cv=none; b=uf91khahYf8aldN641rxKApyWdacJjeuPcCQlCbtEgBXhfQlS/tshAWPnU0sgAAZDQDvk2aaSoUZlYHmh+IwyNxOXTkEOH//XJWgbMrO7k9t/P0rmTzCPtHEkr4mxBcZWdNEPLkxdac8Ri06L78q7y8tWeRVJ0gamc/KlIeD7pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769035874; c=relaxed/simple;
	bh=yWkY+UHjIsVWWucZVtJVRKqou4DthkosLf0vkVsVgXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z4XpcYBI8Hrijg6Yv0wRYlfZMWyx8fppXIFM+p1guhb2IiePLsEnMnrRXs/+hpsKWtqLdp/2SyMFllvV+W6NgtOg0gtqFKe9AyFdNmeoii0pZhLLLOpHjwCrk/KvRWgwB8Gq9Ym9HaXb5oueYyF0BWhvYIrUuNzmwka2ns+1X98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DZgQ9U0+; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=lGivQTIj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769035866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=Yi8dtRe+OkhFN0mZv7ax8V9fdnQTxFvioYJNH369UP8=;
	b=DZgQ9U0+04fvZkaINwvyzxkDC1OTvBXnpPS2sDz3YTn0+FlAMKWntJD7Owq6YyJ6tvOMFS
	xSJMuqLR9YnOMZh95zPc9E+RZNSD4BU9L8kFRgaylPZS8f+kZ6kFt/Kie1jQqJhQOZ8O45
	hLH5um1T428BCRAwBcZdNRJJnyuz8xE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-lehfC0ywPFuy3IHNzKXftA-1; Wed, 21 Jan 2026 17:51:05 -0500
X-MC-Unique: lehfC0ywPFuy3IHNzKXftA-1
X-Mimecast-MFC-AGG-ID: lehfC0ywPFuy3IHNzKXftA_1769035865
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-502d38a3e39so4715041cf.3
        for <linux-rtc@vger.kernel.org>; Wed, 21 Jan 2026 14:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769035865; x=1769640665; darn=vger.kernel.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Yi8dtRe+OkhFN0mZv7ax8V9fdnQTxFvioYJNH369UP8=;
        b=lGivQTIj7cm49qRJ6/5Do0zLSDPU+WF9bgGaTv4Sf9lLWoKihJL79aiwwRAAd0bAau
         4Z+R4LUDz+/q6H2NqkJ66do95xijaV7Re65A7vPhNPJXpaGi5qSw2ef12n34PnPyENfR
         rF28jGi7e4tEVsif2uakgy8ZBLCC5jQdxCbQdnyXKtnJIkMmFUEZJY3yUm+YOrqtcU4T
         5aX0kriW7MohjP5xx/bDrn5h29HYwLw6pkULzN3pybqO170L4KEUOO5H7GYREh2RrcB6
         jR/31tytsNOb/p3asOSimFOkvCs22i2/w8Xbw8VRR6Lv/EfjEwXwt7jPO6sdjA50Fslw
         Ttzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769035865; x=1769640665;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yi8dtRe+OkhFN0mZv7ax8V9fdnQTxFvioYJNH369UP8=;
        b=CBwAos3djmSN4lFznfQyiCOOujqwVBVrcanvpv9WEjEG6Cfsey+26oUCBmEj8cbye5
         39k9nrcaEnKF0nvLD9H2kzB4y3GIvlrIvJzSf7jIDAR31eHtvc8v3/dR9HzZuuh+A+g7
         +mg+S81wsmHxmQdfzsRmF87TyBKSLQ0d9BPLYSbVvfl6WcnOOC9jhClmMwE44Z4yXrE3
         GDaR5+rcFEdRMhkd9F2lSlCoqkW8/gtuN+LboYHnsmGs3LWbjJjtCxGFqC6kDaMd1on2
         Z6xX4QMfcE6Kbg5HWv4drI13pQ6jyvVPzDepdQhJ7UyDL0UnqnlHpjqzSqG17z2ZMxZw
         1I0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVsMg0MrmX4BL6Cy6skP9ssNf3VViq8On6fJ9QddW4HsqN2Jz/nks8IrrJ1YkUnkUjhgh3d8yb1gAs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOeVZpic+4xyq48d1QQHobX6sqfPG0L8D8CDTOUcp2NckWXWid
	eg05R0GccPw8iqvE+cGqgCccRhYItOvIELT9P1z4opyGHvK9lOMNJuMZwIbaanRvWCZzpeqdZeX
	3R+t1lavfw/fa/Kzkrt5bu8MVqunukTdDAOnwUH4gdP3DTttF8VN4f3cVQrPHFp2Ax67EbQ==
X-Gm-Gg: AZuq6aIGybiuilyu0ABW/2iuxzhxeI9QC598xZDpEtWJlBT+I0Aplyowd4r+KgxQuEu
	AGn9x7acJ+5jJLoXJOLff5RmAwmyLDbcn/L9YKP+qhDE/fDIyz3xXRKVm7LAob1t+v4xkb9pSfz
	2Vs2llPK+76IJynDaVWTwUd7dcGI3DNIIJo1cG7OpUfELANsRErZe5KPGkwTGoCqRrJ5FJVvhZt
	goyvX3v73hW/VzKE9fN60iDAe8SaFC2SI88eGkL8oSkMHU+WMT0eM/xC5wHgvZwR7JNxkZz3lOV
	VvtNJJ8v9HtrP4wHzEMTbJVae1mu0tg/0h4u056hqL0k3/e5Hd3yf5ToVFdK02IXGM6HOcjGG3g
	GYMOWRg+v
X-Received: by 2002:ac8:584f:0:b0:501:3d11:18ce with SMTP id d75a77b69052e-502d8523a03mr93018261cf.65.1769035864753;
        Wed, 21 Jan 2026 14:51:04 -0800 (PST)
X-Received: by 2002:ac8:584f:0:b0:501:3d11:18ce with SMTP id d75a77b69052e-502d8523a03mr93018031cf.65.1769035864344;
        Wed, 21 Jan 2026 14:51:04 -0800 (PST)
Received: from redhat.com ([2600:382:8125:73a8:e201:8ac3:bd7d:6acd])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502a1efb0b2sm123098491cf.29.2026.01.21.14.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 14:51:02 -0800 (PST)
Date: Wed, 21 Jan 2026 17:50:59 -0500
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [GIT PULL] clk: remove deprecated API divider_round_rate() and
 friends for v6.20
Message-ID: <aXFYU324yQ6uBmk0@redhat.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
	TAGGED_FROM(0.00)[bounces-5825-lists,linux-rtc=lfdr.de];
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
X-Rspamd-Queue-Id: 9C7E75F14E
X-Rspamd-Action: no action

Hi Stephen,

Here's a PULL for this large series that continues the work to remove
some deprecated round_rate APIs. I used the following b4 command to
collect up this series:

    b4 am --cherry-pick 1-13,17-23 \
        20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com

I skipped some of the patches that have already been picked up by
others. The last two patches in that series that actually remove the
deprecated functions will need to go in during the next dev cycle.

One thing that I want to call out in this pull is the change to
drivers/rtc/rtc-ac100.c, which is all clk related.


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/masneyb/linux tags/clk-divider-round-rate-v6.20

for you to fetch changes up to 533162201ebcc478739235c6d002971f02f42f19:

  clk: zynqmp: divider: convert from divider_round_rate() to divider_determine_rate() (2026-01-21 16:32:09 -0500)

----------------------------------------------------------------
Here's a series that lays the groundwork to rid of the deprecated APIs
divider_round_rate(), divider_round_rate_parent(), and
divider_ro_round_rate_parent() since these functions are just wrappers
for the determine_rate variant.

We need to wait for some other changes to land in Linus's tree via the
phy tree before we can actually remove these functions. We should be
able to do that during the next development cycle.

Note that when I converted some of these drivers from round_rate to
determine_rate, this was mistakenly converted to the following in some
cases:

    req->rate = divider_round_rate(...)

This is invalid in the case when an error occurs since it can set the
rate to a negative value. So this series fixes those bugs and removes
the deprecated APIs all in one go.

----------------------------------------------------------------
Brian Masney (20):
      clk: sophgo: cv18xx-ip: convert from divider_round_rate() to divider_determine_rate()
      clk: sunxi-ng: convert from divider_round_rate_parent() to divider_determine_rate()
      rtc: ac100: convert from divider_round_rate() to divider_determine_rate()
      clk: actions: owl-composite: convert from owl_divider_helper_round_rate() to divider_determine_rate()
      clk: actions: owl-divider: convert from divider_round_rate() to divider_determine_rate()
      clk: bm1880: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: bm1880: convert from divider_round_rate() to divider_determine_rate()
      clk: hisilicon: clkdivider-hi6220: convert from divider_round_rate() to divider_determine_rate()
      clk: loongson1: convert from divider_round_rate() to divider_determine_rate()
      clk: milbeaut: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: milbeaut: convert from divider_round_rate() to divider_determine_rate()
      clk: nuvoton: ma35d1-divider: convert from divider_round_rate() to divider_determine_rate()
      clk: nxp: lpc32xx: convert from divider_round_rate() to divider_determine_rate()
      clk: sophgo: sg2042-clkgen: convert from divider_round_rate() to divider_determine_rate()
      clk: sprd: div: convert from divider_round_rate() to divider_determine_rate()
      clk: stm32: stm32-core: convert from divider_ro_round_rate() to divider_ro_determine_rate()
      clk: stm32: stm32-core: convert from divider_round_rate_parent() to divider_determine_rate()
      clk: versaclock3: convert from divider_round_rate() to divider_determine_rate()
      clk: x86: cgu: convert from divider_round_rate() to divider_determine_rate()
      clk: zynqmp: divider: convert from divider_round_rate() to divider_determine_rate()

 drivers/clk/actions/owl-composite.c       |  11 +--
 drivers/clk/actions/owl-divider.c         |  17 +---
 drivers/clk/actions/owl-divider.h         |   5 -
 drivers/clk/clk-bm1880.c                  |  13 +--
 drivers/clk/clk-loongson1.c               |   5 +-
 drivers/clk/clk-milbeaut.c                |  15 +--
 drivers/clk/clk-versaclock3.c             |   7 +-
 drivers/clk/hisilicon/clkdivider-hi6220.c |   6 +-
 drivers/clk/nuvoton/clk-ma35d1-divider.c  |   7 +-
 drivers/clk/nxp/clk-lpc32xx.c             |   6 +-
 drivers/clk/sophgo/clk-cv18xx-ip.c        | 154 +++++++++++++++++-------------
 drivers/clk/sophgo/clk-sg2042-clkgen.c    |  15 +--
 drivers/clk/sprd/div.c                    |   6 +-
 drivers/clk/stm32/clk-stm32-core.c        |  42 +++-----
 drivers/clk/sunxi-ng/ccu_div.c            |  25 +++--
 drivers/clk/sunxi-ng/ccu_mp.c             |  26 ++---
 drivers/clk/sunxi-ng/ccu_mult.c           |  16 ++--
 drivers/clk/sunxi-ng/ccu_mux.c            |  49 ++++++----
 drivers/clk/sunxi-ng/ccu_mux.h            |   8 +-
 drivers/clk/sunxi-ng/ccu_nkm.c            |  25 ++---
 drivers/clk/x86/clk-cgu.c                 |   6 +-
 drivers/clk/zynqmp/divider.c              |   5 +-
 drivers/rtc/rtc-ac100.c                   |  75 ++++++++-------
 23 files changed, 245 insertions(+), 299 deletions(-)


