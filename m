Return-Path: <linux-rtc+bounces-6803-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id dV1lGkWqRGqhygoAu9opvQ
	(envelope-from <linux-rtc+bounces-6803-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 07:48:53 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0835F6E9EC1
	for <lists+linux-rtc@lfdr.de>; Wed, 01 Jul 2026 07:48:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="MGfH/kus";
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6803-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6803-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7362B301DD29
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Jul 2026 05:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C5243911CE;
	Wed,  1 Jul 2026 05:48:51 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F79352030
	for <linux-rtc@vger.kernel.org>; Wed,  1 Jul 2026 05:48:50 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782884931; cv=none; b=S09baI6RuB7ZzSMGn5sleahtpkdxEyaZGjSgY6KP9s6IsyhieXAtIe8SxE2NbE6ezgtVEI5HyNMog/ddCZlEA0LQwauCW0RhIzva7S2RfwoP9/+pJfD2aC6jSUSnfkM6eU3He+w5JyAR4vPwlz6AXxCFkiCCgrrtpgTjhow2SYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782884931; c=relaxed/simple;
	bh=O6xbzpfwgYUtwGh6OVTjg0pM5p2w7pTevIQ6kY/2ozs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qC+KyMiFcKXvSbdQgAcKWVc5pnM6kTNEogw2Bkvc1toMR9UnGXD4saXng/F+4LUom93tqtqdkUVUIBJ70hcbguHf7i5qkitT9qEag0MLneXIg11RYjnLoSXOmqthnGZhxNB7tGESV1Lvww9sEQ2WuvKZnTWSJx1XO9oVYyuu1wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MGfH/kus; arc=none smtp.client-ip=74.125.224.49
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-664de279fadso341597d50.0
        for <linux-rtc@vger.kernel.org>; Tue, 30 Jun 2026 22:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782884929; x=1783489729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O6xbzpfwgYUtwGh6OVTjg0pM5p2w7pTevIQ6kY/2ozs=;
        b=MGfH/kusValSWGS2sOYAUZg7P2dHCrIE4+i5MC+fqg0jRrtpayUdRNqekt0iVYMoUv
         f3SE3ZHg9KjuonVL+acd0t07/FmT1zSLkU28Mb+JFeG+gaeQra0JznX5H2JLE2U2qpjr
         A5Vy36pHzkLEysoPJ9MappCC0ubyOi2O0i0EMl2Cj5J7WgDf45BXYKYQYApIUPXJszGk
         PlpD/FiQC8JXY/iJxEdNtB2olgYQiMNQJnphywgllciBr3nt9yu3FyVuOHxbwlqDKN0k
         Qp7us9xk2ykcWKDGqBzQ+peVBDPacwLxILS9aNpuBzVQxdZqqHLEL88ZjteYAeELTLEl
         aFuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782884929; x=1783489729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=O6xbzpfwgYUtwGh6OVTjg0pM5p2w7pTevIQ6kY/2ozs=;
        b=M2J+hCT1nW4TU75Ty5XTC5qHj5S+LI5ujmqakEZnASvnbjdYX86jrd11y8d2MAvi40
         uBAoDxt56zQdk8sFOLuMqO/6CqDHbSQt5Go2DbKDOmF5KBA8TI5+Y3oP6pAdlNt8a6aG
         WQrfkjTdLmeQ8ANC9v2eu1XEJHN1VZhcwl3WZEay5hWRx00VBHdqf2wsRlMVoOuyA0ye
         LbEytMd+ZoWzADiDgJPTNRgaPtAguMpM9TAZW+Vpn5pBuM+34Xvl64XaUPsb3cnHvTIE
         YRNtqh5CJPP6E8KJgML+pWtHyV7h39bpoV28R/wtY9+VO5wjQLp026rTFOxxiEwsag/Q
         9uww==
X-Forwarded-Encrypted: i=1; AHgh+RrWnunUZVlZKx8dBu6CH/f5Oa5E+sUyQjU1A9NJkHVJ3N9zyF00GE0el3z/dVxfrcoeBiasOSIePxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF0GXj4RTZBB0E20joLWOMBW24LSF5QyuQAQKSRc7JwPf7y4El
	r4CgAR309ZpbIOxG6OlmvfioeyyL/9ZcSdMA0+box2VzEovrBRtOLLZq
X-Gm-Gg: AfdE7clIwmCzsCtBlQu+0J97hyNHN9/xXxsV1HL/PyPHsqZlywula5YWfaslIBoRB61
	l4hetCj6CyidPtALvp6oFFXtauy3ILSwq0hCKvJQXqUj42sujNoppp7Bn7/k6sttdYesNhdSdHm
	gFLPOvF1SR429oFMjaZOW/x35Ki4Hu3r/Ea4iPa57Ij9nrZTM17flbJ700s5dXnhRsSTNrfkpqt
	NEGLWaUXnvSX3OgY/hSeO0Tf59hIpq/dSd48PUPSyePW1KmsbC87D/KjT8wOnWntjcU7SjTre/4
	a3yroEULLyXkd4XQjsaL8fz/YWCglrMsECR50ozHweLO9ILxFgL+BL+VjzB03xnht0E4hj+JYn4
	ExPbMXCcXYku/SZ3a3BExDXwDY9N9Beh2DJ+Qy/YR3YRsX6rgKua198prvxeSrayfA2ZupqRKJP
	8kPH5hjs0fTqqcYncRJNqo9stZ7JJdLn6yeQvQvgTR7FPA47R4usVXIxWf6pbx
X-Received: by 2002:a05:690e:150f:b0:664:c7b0:f655 with SMTP id 956f58d0204a3-66521ae384fmr205145d50.53.1782884929334;
        Tue, 30 Jun 2026 22:48:49 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-665000c8152sm1920856d50.0.2026.06.30.22.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 22:48:48 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/6] clk: sun6i-rtc: Add support for Allwinner A733 SoC
Date: Wed,  1 Jul 2026 01:47:44 -0400
Message-ID: <20260701054744.3962458-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
References: <20260629-a733-rtc-v2-0-7b72112784f8@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-6803-lists,linux-rtc=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jbrunet@baylibre.com,m:junhui.liu@pigmoral.tech,m:alexandre.belloni@bootlin.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:mripard@kernel.org,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[enzoadrianocode@gmail.com,linux-rtc@vger.kernel.org];
	FREEMAIL_CC(0.00)[pigmoral.tech,bootlin.com,kernel.org,gmail.com,sholland.org,baylibre.com,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	FORWARDED(0.00)[lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enzoadrianocode@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0835F6E9EC1

Hi Jerome,

Thanks for reworking the A733 RTC support.

I ran v2 on a Radxa Cubie A7S. This is local validation evidence
only, not a hardware Tested-by.

For the A7S integration test, I stacked the series with the currently
visible public A733 CCU/PRCM v1 and pinctrl v1 prerequisites. Focused
RTC binding validation, targeted RTC/clk builds, and a Cubie A7S DTB
build all pass, and focused CHECK_DTBS=y shows no RTC, main CCU, or
R-CCU findings. The remaining findings in that base are unrelated
A733-wide schema gaps.

On A7S hardware the artifact boots cleanly to shell and the RTC driver
probes and registers as rtc0. While the board stays powered, RTC read,
write, and a short readback all work correctly; the readback advances
as expected.

I am deliberately not adding a Tested-by. The RTC value does not
survive a full power removal on this board: the published Cubie A7S
V1.10 schematic exposes the PMIC BKUPBAT pin but does not show a
connected backup battery or supercap path, and Radxa's A7S
documentation describes no populated RTC backup battery interface. So
I can confirm the driver is runtime-functional while powered, but I
cannot honestly attest cold-power persistence on this board.

Happy to rerun only the persistence phase if a valid VRTC/BKUPBAT
backup supply is identified or fitted.

