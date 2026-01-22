Return-Path: <linux-rtc+bounces-5845-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MJGMdxKcmnQiQAAu9opvQ
	(envelope-from <linux-rtc+bounces-5845-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 17:05:48 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 889B069805
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 17:05:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 48A473002783
	for <lists+linux-rtc@lfdr.de>; Thu, 22 Jan 2026 16:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA271426EA8;
	Thu, 22 Jan 2026 16:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Eh0vlpRo";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="T0RKbfFw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF464A5B0E
	for <linux-rtc@vger.kernel.org>; Thu, 22 Jan 2026 16:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769097940; cv=none; b=EKNacen6Kg3D5TT6N+LOq3BwlQ4Fom2wK4ZgrVsgKnfpsEaVCjg9PywCvm4EbFeD+NPEw5QjDbWqUtzBXW2+0NvqqwCuxdINGsl0H0IoQ4twoB7Uppah5mMe+2bLGfbbElt8Si5+dNPodUFhSWxA7TKOjr9mZ9RnRWGXZP84K50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769097940; c=relaxed/simple;
	bh=eZ7GtOnPnUjwFAMKpgZVqTk2gRTNJ6uuZdDIiOCCHzM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UN5g1DEJcNarEkq5bA9dAJ7Ef05CK69nSeeLZPSw0FQDMjyamhG0JCBbOKNEXckC9hPBoJe0nMo8uFHHmMFmX/UPhqzTHgpoerTHN89iuKZRoTsxocbk1LsDXjCLGGA99HWvzkJI1NpGcBoNYfVTBAE7NlY/vYi50xnP1xaSowU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Eh0vlpRo; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=T0RKbfFw; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769097924;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=8NmUi+JCIHLnFNZPL3W+AznGM/aqprY8hMKt/Ws5doM=;
	b=Eh0vlpRoxhEA9ZEkZIm0YTjd7TDCrdeGALAKNqEM21rve8auh2wvvnnqG+4pZ56Yv68Tfy
	MrG3jCl0jQKPY+h0SBKaK6fv6p09BS7ASSwlNVF7rsghc6d7KCJThtKaWVjnjmLq54yVqg
	ui0M1KlxNvoHG5AxTg+z44tV2c71Nug=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-QqJUmGNgMnahCX1TJOzrHw-1; Thu, 22 Jan 2026 11:05:22 -0500
X-MC-Unique: QqJUmGNgMnahCX1TJOzrHw-1
X-Mimecast-MFC-AGG-ID: QqJUmGNgMnahCX1TJOzrHw_1769097921
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ec338650e0so2402711137.0
        for <linux-rtc@vger.kernel.org>; Thu, 22 Jan 2026 08:05:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1769097921; x=1769702721; darn=vger.kernel.org;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8NmUi+JCIHLnFNZPL3W+AznGM/aqprY8hMKt/Ws5doM=;
        b=T0RKbfFwPIfU/1E06z0HcHPcqylAeHcm/ZuPiTV5kDv3XvYqq1JH03ZlzLDdfJYmpc
         zD7TZ5+k2FVZjK6EZlwHa+V9TGlDbCL1mCvZRSpdj7gx4Qz7/UATifQHaagmTsZdMXXp
         BDFEj9bpTgnZSKc/yO9Vfm/q0ZQxJ3tsAHF6P8xIvr5SfaU1PoGxP4f87mhVYQd5NPs4
         DIcf0RnHklcYeWwHvGr+RXnXUunkGuFjwZvz98enee6zGLARjuFKZ9U0d6WZ/54i74wk
         2L1N35J0ElfAni+Jeie4xvx0qi6cuxQtdtRr0fIfFX1DeDNtxVx2O2+NIuOoI7wOBzci
         cP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769097921; x=1769702721;
        h=user-agent:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NmUi+JCIHLnFNZPL3W+AznGM/aqprY8hMKt/Ws5doM=;
        b=shDd3N8Tt0RI35L6P62a8mFV07RDQMm/YnXjZTaFbtySTxi6czwfqVq3L3kFd9pzYk
         8GukUunh2Eg8Uyg+jKFrX0XsrN0XKxgQVLr0aWlD7u9KN5YNbQbEIa9NA3BFHmLL0nMc
         a9aSlV98sbfVKcZf6YrOwHuP1F7qxmHSLtpflvqGTpP3jvKe3wZ6WARq/oTk24kDLADX
         lnzvQH2YHZMpltBWpw+sCqQojQOYTfH2j475Mnx6haq2mvzSbrTDBZpSL96gdFgEfvIz
         NJLLw5XdeNUbZU/l3crOPXOcNRrUIjjd+IBoHeZcOySxvhtOrgOeC8FCX6LqaH6pHKwF
         syXg==
X-Forwarded-Encrypted: i=1; AJvYcCUSIaApPAdZgUZc3bmms3Y7/GSL91YGJxOu2SiMY91Ospn2bt8u1X0GTe3sknRncadLPa3+zVpGtVw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhDhyJ72nDgpqNcpPkjwGLAnH13FWYJHzlTqwc+J9eLHfhEAxM
	qJ6t9sZe9hUo1b7K4gYDyGDd5UlCGwrnls1krdbaxkKdBI+Q+47GHYzVa9OdnXHfhL1xQqNXVuG
	64lVFXU4+b2GY4x8AixWQeLJ3TarEFIzsv/aI6rcIr9fGv6dnAA3EaX/dPgm/aw==
X-Gm-Gg: AZuq6aJIIJgUmyT0BjmLfBBNxF+oNRUOKT+5petbeS2TGvTYhGwHT8ZDei7leyKwepA
	e+yL3tdLISuRlCwqIly7kt1/x+ZOQSwrXtx1lkapEnp5DarA7j7AVxCAQzhWkhL9D2IPPj2Gg/E
	eu2tTKIseWQ7VFO5lLietaPs5nhWxfVP+ZtNQjg5NdbCN9kFuX7QmMKLibUejKLXspdYstPxW3U
	V69JzYoHejsAhFjIQyY27/WbaAnI4FfAImWmR+E3q3TIs0uTwSLnM7MsA217FKPTIKq1b5mouuz
	hMa2HqAFLzrkuxFIhnaaCs6QqhW31Oqw5BJmwtGycWacX20B235i3JOLDVxAKUdZhSSAulg/9tb
	LiXwTy+vLU6vRj34DguRY9boe3oXYbr2aKt/7E/acfwT1
X-Received: by 2002:a05:6102:2ac4:b0:5ef:a164:ebed with SMTP id ada2fe7eead31-5f54bd36d33mr49646137.43.1769097919966;
        Thu, 22 Jan 2026 08:05:19 -0800 (PST)
X-Received: by 2002:a05:6102:2ac4:b0:5ef:a164:ebed with SMTP id ada2fe7eead31-5f54bd36d33mr49576137.43.1769097919200;
        Thu, 22 Jan 2026 08:05:19 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6c9defsm157919766d6.48.2026.01.22.08.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 08:05:18 -0800 (PST)
Date: Thu, 22 Jan 2026 11:05:16 -0500
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [GIT PULL v2] clk: remove deprecated API divider_round_rate() and
 friends for v6.20
Message-ID: <aXJKvOJVrBIeCiny@redhat.com>
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
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-5845-lists,linux-rtc=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-rtc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 889B069805
X-Rspamd-Action: no action

Hi Stephen,

Here's a PULL for this large series that continues the work to remove
some deprecated round_rate APIs. I used the following b4 commands to
collect up this series:

    b4 am --cherry-pick 1-2,4-13,17-23 \
        20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com
    b4 am 20260122-rtc-ac100-divider-round-rate-v2-1-044f8b493c35@redhat.com

I skipped the patches that have already been picked up by others. The
two patches that actually remove the deprecated functions from drivers/clk/
will need to go in during the next dev cycle.

The only change since the v1 PULL is to drivers/rtc/rtc-ac100.c:
- Fix two cases of brace inbalances around if/else
- Picked up an Acked-by from Alexandre

Details are in the signed tag.

Thanks!


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/masneyb/linux tags/clk-divider-round-rate-v6.20-v2

for you to fetch changes up to ed806240b8975f951c88ccb4bb75813f5fb949df:

  rtc: ac100: convert from divider_round_rate() to divider_determine_rate() (2026-01-22 10:49:10 -0500)

----------------------------------------------------------------
clk: remove deprecated API divider_round_rate() and friends for v6.20

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

Note that this also contains a clk-specific change to
drivers/rtc/rtc-ac100.c, and that patch carrys an Acked-by from
Alexandre.

----------------------------------------------------------------
Brian Masney (20):
      clk: sophgo: cv18xx-ip: convert from divider_round_rate() to divider_determine_rate()
      clk: sunxi-ng: convert from divider_round_rate_parent() to divider_determine_rate()
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
      rtc: ac100: convert from divider_round_rate() to divider_determine_rate()

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


