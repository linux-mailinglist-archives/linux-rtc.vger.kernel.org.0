Return-Path: <linux-rtc+bounces-4454-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D9CB00651
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 17:21:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFB473AACF2
	for <lists+linux-rtc@lfdr.de>; Thu, 10 Jul 2025 15:20:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A5927466D;
	Thu, 10 Jul 2025 15:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hWTlYsg+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8A8271447
	for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 15:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752160855; cv=none; b=sPahskNF+vLaON4EyVaAByUFzAJEK97B6P5WqRYiKIQ3hem12LrHrJg5LBEO5AddotgkxiEOkM22Fh1emVRCp/3COTtnQzlyamevaDd1nTeWhhAlmb1DsdMT53xBIKhhBDTwZpkCI6kUaf7D4QGkEY6+0ENzZ4OLfGOlx++yGEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752160855; c=relaxed/simple;
	bh=9M3wopRrGysSMIdgOwMKcjjazdX85vpeXMPuYsQrbNY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BqIZAGpHjGUyE/UnGvzD+kY66dHC+IbOfRrD/kaGvLgDqM9DtZAU9vwNY37j/J8F9Zd1/Vo6b4shr3feg+dUimlGWaahOb5aGZDuLT5RqNDrYcJ34T9bZD4jcP5F19NxZNoEolWu2hChrv6O2lu1FlToW8QreHM7QgAO5SZrKMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hWTlYsg+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752160852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ds7++Ij2+1V4ib5aZvqnghth0svM2cKB0bqVi1/rlYY=;
	b=hWTlYsg+VjlBwm4Piq8aboa7mfWKw/VxLab0EuP5uV0cMC6osf6K02BadEa2ygEUc4bSRp
	GONcdopOEiYnyUjCOl8Gt0m/XS+ernC+pqU3ML+hsYcogSTd8E9HQ1KXXAeC8CjZ3uK6ss
	Ch8yy7UlCBCmI0r1cumTiIcLHnzv8NU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-4BOLuq6yPLOSXqOSdLClYw-1; Thu, 10 Jul 2025 11:20:51 -0400
X-MC-Unique: 4BOLuq6yPLOSXqOSdLClYw-1
X-Mimecast-MFC-AGG-ID: 4BOLuq6yPLOSXqOSdLClYw_1752160851
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4a44c8e11efso30443791cf.0
        for <linux-rtc@vger.kernel.org>; Thu, 10 Jul 2025 08:20:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752160851; x=1752765651;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ds7++Ij2+1V4ib5aZvqnghth0svM2cKB0bqVi1/rlYY=;
        b=LD7FiJ/BuYQICY72Rh/FdO02fMlYutjopdZoTFmh6jOQr5fw+SeAkMOXgSdBtXSgF1
         qVMCS6DRsXtuVEUg0iE9Y2/U0SYacm5B61QHmYr6HrG7X873+FrnAvg9MxeA+LV46mAY
         /V+AbP41RU2tSdp+k73wWD5Yqkaj7VQvOO4U5td4oYuRqbaTZ4VCiVQfsTT13CGqNSuw
         S6fOK5KBJhzTd4yeRQYwoQneDzc97uQ7TWiFW+UrMKSsQfLeTkgC1XD4z2eJ6v/IGQwY
         Ag8f2aJf8otIX5MD5k/i7eO03yc/tUvAbRg85q5jh0eA+SxRahOuh6Ij87E8UJSoldGv
         QsoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUzj1R8PJqYPBJL5PMITN1+XLVwMEjJVEMAjnOHzy5xrzcdLMzJItq2yST7CUGrKtTmOWif8ouxV/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws2WZVMv/sv6DIT+EqzFmUeAZ0ba/sCRsD3BJ7atmfswJ4Yz70
	6Wz3vPBP+4tv6UtwyF2emnZa8XO+TuHq1l6M3dHjKy03o8jGJIS1PeqrShU2F78s6IyrNTwf1cm
	4sShkppIpJhbYg944o8Zq7gpWMJ+LPicPo8KN+xWXcDWmi8uvDtm5bqufkINsvQ==
X-Gm-Gg: ASbGncsDwXcJ33bSjPYQ1bpT2ges7IYJV1RK+z8FAeQ15irmPCuqp41r2lXVEt9AeTl
	2XEh/lpoPn0bls4FfpH5DnyJlfXLaGxxXpCLmeS6KEHlH2ZwsVrgBmB0DJ0FL/Ihl15jLqEkSVG
	M04DBBtzfjjQe3NFta30WFglni32TA8kdiacBIS23E/I7iVtfONjz7umu4XZwf7dgh3XDPc25WF
	5TOLFyKNCsO1xrRQyJublPSMX3bXHrP9hWhfVsP1WBxFTIjzEH3M8LsnK8LTdizOTdJlpPwZqXP
	/iCfFUcVOWlJEwfJ49zcM8q1OhBHzaayoaZNr8TkKFaZLg+dRhEfetGHvnQI
X-Received: by 2002:a05:622a:1144:b0:477:1ee1:23d9 with SMTP id d75a77b69052e-4a9ec75e251mr55309901cf.20.1752160850857;
        Thu, 10 Jul 2025 08:20:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEToM0xvOjTAuNFn12a/+Huuy1Y8IvYOkC01RE80GL773b7iqyZVQh3usJvnkGTDa9plKREUA==
X-Received: by 2002:a05:622a:1144:b0:477:1ee1:23d9 with SMTP id d75a77b69052e-4a9ec75e251mr55309261cf.20.1752160850187;
        Thu, 10 Jul 2025 08:20:50 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9edeee2c2sm9654471cf.74.2025.07.10.08.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 08:20:49 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 00/15] rtc: convert from clk round_rate() to
 determine_rate() and fix a few bugs
Date: Thu, 10 Jul 2025 11:20:20 -0400
Message-Id: <20250710-rtc-clk-round-rate-v1-0-33140bb2278e@redhat.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADTab2gC/x3MwQpAQBCA4VfRnE3NEuJV5LDtDiZamkVK3t3m+
 B3+/4HIKhyhyx5QviTKFhJMnoGbbZgYxSdDQUVFjSHUw6FbF9TtDB7VHoyG2pLq2htbOUjhrjz
 K/U/74X0/Vlb142QAAAA=
X-Change-ID: 20250710-rtc-clk-round-rate-1093066d1a5c
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Akinobu Mita <akinobu.mita@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Heiko Stuebner <heiko@sntech.de>, Andrew Morton <akpm@linux-foundation.org>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Mia Lin <mimi05633@gmail.com>, 
 Michael McCormick <michael.mccormick@enatel.net>, 
 Heiko Schocher <hs@denx.de>, Parthiban Nallathambi <pn@denx.de>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752160847; l=6092;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=9M3wopRrGysSMIdgOwMKcjjazdX85vpeXMPuYsQrbNY=;
 b=AA9zUj0gJWaQ5insN3QRj2sCaM8YtZtb1pwCdKfcn8t61rNC+0mFATNTarVGL7O+fipo2Lz7w
 iG1H+HResmQB2HXjyK41d1ZGP7JTaY4eabya5WkXNS64i/eBlg0iQAu
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=

The round_rate() clk ops is deprecated in the clk framework in favor
of the determine_rate() clk ops, so let's go ahead and convert the
drivers in the rtc subsystem using the Coccinelle semantic patch
posted below. I did a few minor cosmetic cleanups of the code in a
few cases.

I also noticed that in some of the drivers that if round_rate() is
called with a requested rate higher than the highest supported rate,
then the clock is disabled. According to the clk API, round_rate()
should instead return the highest supported rate. This series also
updates the functions to return the maximum supported rate.

Coccinelle semantic patch:

    virtual patch

    // Look up the current name of the round_rate function
    @ has_round_rate @
    identifier round_rate_name =~ ".*_round_rate";
    identifier hw_param, rate_param, parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    	...
    }

    // Rename the route_rate function name to determine_rate()
    @ script:python generate_name depends on has_round_rate @
    round_rate_name << has_round_rate.round_rate_name;
    new_name;
    @@

    coccinelle.new_name = round_rate_name.replace("_round_rate", "_determine_rate")

    // Change rate to req->rate; also change occurrences of 'return XXX'.
    @ chg_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier ERR =~ "E.*";
    expression E;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    -return -ERR;
    +return -ERR;
    |
    - return rate_param;
    + return 0;
    |
    - return E;
    + req->rate = E;
    +
    + return 0;
    |
    - rate_param
    + req->rate
    )
    ...>
    }

    // Coccinelle only transforms the first occurrence of the rate parameter
    // Run a second time. FIXME: Is there a better way to do this?
    @ chg_rate2 depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    - rate_param
    + req->rate
    ...>
    }

    // Change parent_rate to req->best_parent_rate
    @ chg_parent_rate depends on generate_name @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    @@

    long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
                  unsigned long *parent_rate_param)
    {
    <...
    (
    - *parent_rate_param
    + req->best_parent_rate
    |
    - parent_rate_param
    + &req->best_parent_rate
    )
    ...>
    }

    // Convert the function definition from round_rate() to determine_rate()
    @ func_definition depends on chg_rate @
    identifier has_round_rate.round_rate_name;
    identifier has_round_rate.hw_param;
    identifier has_round_rate.rate_param;
    identifier has_round_rate.parent_rate_param;
    identifier generate_name.new_name;
    @@

    - long round_rate_name(struct clk_hw *hw_param, unsigned long rate_param,
    -               unsigned long *parent_rate_param)
    + int new_name(struct clk_hw *hw, struct clk_rate_request *req)
    {
        ...
    }

    // Update the ops from round_rate() to determine_rate()
    @ ops depends on func_definition @
    identifier has_round_rate.round_rate_name;
    identifier generate_name.new_name;
    @@

    {
        ...,
    -   .round_rate = round_rate_name,
    +   .determine_rate = new_name,
        ...,
    }

Note that I used coccinelle 1.2 instead of 1.3 since the newer version
adds unnecessary braces as described in this post.
https://lore.kernel.org/cocci/67642477-5f3e-4b2a-914d-579a54f48cbd@intel.com/

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (15):
      rtc: ds1307: fix incorrect maximum clock rate handling
      rtc: hym8563: fix incorrect maximum clock rate handling
      rtc: nct3018y: fix incorrect maximum clock rate handling
      rtc: pcf85063: fix incorrect maximum clock rate handling
      rtc: pcf8563: fix incorrect maximum clock rate handling
      rtc: rv3028: fix incorrect maximum clock rate handling
      rtc: ds1307: convert from round_rate() to determine_rate()
      rtc: hym8563: convert from round_rate() to determine_rate()
      rtc: m41t80: convert from round_rate() to determine_rate()
      rtc: max31335: convert from round_rate() to determine_rate()
      rtc: nct3018y: convert from round_rate() to determine_rate()
      rtc: pcf85063: convert from round_rate() to determine_rate()
      rtc: pcf8563: convert from round_rate() to determine_rate()
      rtc: rv3028: convert from round_rate() to determine_rate()
      rtc: rv3032: convert from round_rate() to determine_rate()

 drivers/rtc/rtc-ds1307.c   | 15 ++++++++++-----
 drivers/rtc/rtc-hym8563.c  | 15 ++++++++++-----
 drivers/rtc/rtc-m41t80.c   | 21 +++++++++++----------
 drivers/rtc/rtc-max31335.c | 12 +++++++-----
 drivers/rtc/rtc-nct3018y.c | 15 ++++++++++-----
 drivers/rtc/rtc-pcf85063.c | 15 ++++++++++-----
 drivers/rtc/rtc-pcf8563.c  | 15 ++++++++++-----
 drivers/rtc/rtc-rv3028.c   | 15 ++++++++++-----
 drivers/rtc/rtc-rv3032.c   | 21 +++++++++++++--------
 9 files changed, 91 insertions(+), 53 deletions(-)
---
base-commit: b551c4e2a98a177a06148cf16505643cd2108386
change-id: 20250710-rtc-clk-round-rate-1093066d1a5c

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


