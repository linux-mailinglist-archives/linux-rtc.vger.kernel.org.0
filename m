Return-Path: <linux-rtc+bounces-6791-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7DZEHtv5Q2pymgoAu9opvQ
	(envelope-from <linux-rtc+bounces-6791-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 19:16:11 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE876E6D26
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 19:16:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=baylibre.com header.s=google header.b=nafyC110;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6791-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6791-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 726F83105083
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 17:11:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5E53DB64E;
	Tue, 30 Jun 2026 17:10:52 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F133DB328
	for <linux-rtc@vger.kernel.org>; Tue, 30 Jun 2026 17:10:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839452; cv=none; b=kF5NdOfZY7/rAX59HjEeCFPNsu5hOQbPsnnz//T2MF5Dgh77bzsPRw7wXsBXLky8FAwdszY5PayddeSaNuAXBCf68FYJvCuLKHdel6GmzpySZ6xU49qpIG9sRYNhtBV8fPHkO9Kan1oPn7pnCHOEBzqtDwfPrqn6DfLP1KzRVDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839452; c=relaxed/simple;
	bh=eQ7/O2c1PPFdsCBMpweqHNdGVui5TTjsxVHoN0Oahc4=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ocV45WLKKOChDpTvfLQZHjgei3ma9FeDsfWYpzF5A9zJGf4hzJHPMQu+OezffnJVKxgJDN9NygZMw6ov/YyqJTuw533/LQ1iAI3KATRBKa4wTg5us1w5NwQ07RUBJ9BLpsKZad3KOIXTBP6iZm0SctF/stxMm4qX4BurLNehHbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=nafyC110; arc=none smtp.client-ip=209.85.221.51
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4763b0c1dcdso715327f8f.2
        for <linux-rtc@vger.kernel.org>; Tue, 30 Jun 2026 10:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782839447; x=1783444247; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6Ws60UFeculpey6gcO+MdrufRN/5OGRb+gmogOD2VK0=;
        b=nafyC110l82mvlcDB+wnISFKUlA4m3ZOj4PTJXoUg0XRY2hHPeTyuXSO5RMuE9z1HF
         HhKJffOyirfGaRcZi6r71//9A5SrHDXMxmrycduhzc8QuQbjDrneMJo1KjPlS431T+UR
         W9wXt7aXeBKiTW1Uwdxk77wjQxbbzFGwM0SEo44lKzavHWWifM8RwEjCCedMiWDxWH+d
         HEDvk6viR9Z8t329SpirrKF/X49KW3LR2mb1NuD6k2x5BON7lYIg2sG8GJNnch6nkOJw
         PjiKKqkppdnydaWo+7mGn6r+8JYgnuF29YUm8JuF1o7s+EuBWFYYH5dcqpibD6o57tfk
         96Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782839447; x=1783444247;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6Ws60UFeculpey6gcO+MdrufRN/5OGRb+gmogOD2VK0=;
        b=awbqA+G1PTLbvMZNBWjEEdDZUArh4Hxi+RMTjjlzj3Df64ZZxUUde7NS0YtToKKM2Y
         9iKQapUHm5GZrFTXxeI6mXazQF4s2pilImRQuQRK5+395SCUApSsjA0iHB5eM3XTRWoi
         RnJx3yAP6VA964sgXWhY/AyoD0Z7wOXDqCbzCmOzlvfzpPznGLAp45srJGBjHrlbtzSv
         nKjAbNclAdCsJEY3mxwfitDUq0pe4PndiDRs/UZdy8F59BAUMAupcaY4W947Ji7Z1oi3
         es2e3sIqov0ulqz+rM92yNs8BKYxoR1P43M1wtd+25LUs+ZhhnHFGtXqvdAFwsREvZBD
         y9YA==
X-Forwarded-Encrypted: i=1; AHgh+RqKY8gtcfxS3YkKdF8IXc0DrYV/NhrVChKMDZ9ilcQHciSopw4tGe0QoUyZECiq9pllBDnHFGXyXC4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6VjEYeUqCvI47VdoaqE4ZsX2DBFu3HgCFv3FaN4giv0zY9RCX
	mbelyaZ2Oy14Z9sM2foEuQxF2+x6+CvwIll1bemQjZ/FLhwfNBYATyoeLJzAYK2SMLc=
X-Gm-Gg: AfdE7ck79+78yRuoU06umxVi73PlWLa1ddP3lq9HRQCTVfswyCY2Pev6eBridKBH6x3
	9G8y6PtSB8j+bbprH9E2otKzQrBJWTZTl5JqHsh2ZfSL/RFzan7B/CXlv0qioSgaperOHL2ipJL
	pdB7Aj4WmmAbGV1Ge3O/FE1SVhgGFEeZ6/01v1wflZAhOJR6SIn+rsqEAYAvF+/9WNSpRi/XDvH
	TQDuUrP5QC1uNNGp3f+UMThPhrkQDMXnFGKZamw6olJtjTSEODtDEyF6jQ3GAsqLMwz2Z+HvzSk
	EgfKgdz/gcSsjqb26VRYWT2KCq8oQaRDUKa5XHj7cwal02f2cyoOW1ZhxjFw2mfzvFyK7g0ooJW
	Yaq6zEtBlGGt7Phve+8/uyxcxRFshhUHMi1IEHAkNcFKpAvgov9ohiUhXKxw6hdLOCnOGajX8nl
	gfmjXJR6sfBwfCNO7WROy2nWXuzxjTvLMRklSXE0TFykuJQeM4Co4F
X-Received: by 2002:a05:6000:400a:b0:475:f100:35f4 with SMTP id ffacd0b85a97d-475f100369emr4048958f8f.49.1782839446625;
        Tue, 30 Jun 2026 10:10:46 -0700 (PDT)
Received: from [192.168.7.218] (88-127-185-231.subs.proxad.net. [88.127.185.231])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47563d195a7sm9017973f8f.7.2026.06.30.10.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 10:10:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/4] rtc: sc27xx: convert to dev_err_probe()
From: Alexandre Mergnat <amergnat@baylibre.com>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
In-Reply-To: <20260528-cleanup-dev-err-probe-rtc-v1-3-29dc9cb6c3f0@microchip.com>
References: <20260528-cleanup-dev-err-probe-rtc-v1-0-29dc9cb6c3f0@microchip.com>
 <20260528-cleanup-dev-err-probe-rtc-v1-3-29dc9cb6c3f0@microchip.com>
Date: Tue, 30 Jun 2026 19:10:30 +0200
Message-Id: <178283943066.3929176.6726461651736828114.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=364; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=eQ7/O2c1PPFdsCBMpweqHNdGVui5TTjsxVHoN0Oahc4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBqQ/iQNQsacvY2xdWCu6SjLA2RJnFZU8CTlX58T
 Z1KN5zC9muJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCakP4kAAKCRArRkmdfjHU
 RYrxD/9P/5Kf6FO2Lamnm05ObJj7fqQeMhEjTlHqwi4udrjhoMJUgtrtAnJTDq5UEVwMlOpX9NR
 Ow4ChQKetLp74AlKZ54C23r7/KtbYvkmaxYLY+lmahCIRtfl5uJ2owv445sdLB4RnTmMs9fYkMB
 9Sr377o/qQYxflBNI8xnx+ezMYU5hPT3MPCP0m+3azexww3EsEVpc3QB31n4w+Uxqykzr9g8jf1
 OSZxVeqQ3G5rh4XySZsjT0s5+/9CHi2T50jc346sMuBX6psyt0LvThxwf3woHnW+N/zbHDC7nUU
 uF8TYPkJaZrobIVNuJBC9teoBgEVVNeCK/wJ821NF5866EN0bDuL+CIlJfJsg5scXv4CHzYtj1/
 yI6g9EjN22JdqGg+LRYki1MEyq/LYMsVO1E3ECSaV0lh7zijAySpePb2iJEQBirq02jE95W8sui
 IDdTnOJXAcXFqsh/NXDbXmcWlE4oh4fY3Ph26F6mWCGmJADSUjm+uR90vngOHFRpZ55omlTNMoT
 8aLP4SuJEzgRVrbozSUsjfnDT+Jcjocx3MEWXDrGkfB7Lc++9ZErzD5JA2+d5LBzK3leD5K0/T2
 ebWFmRUctSHv85a8hMwXqbr/TR43Cen5jPdNAd6DLSrMjni9K7db+KCPBVzxTcZ7ssiGFeB4X2r
 pTBgiRmfUR/Qz6w==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[baylibre.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6791-lists,linux-rtc=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[baylibre.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:balakrishnan.s@microchip.com,m:alexandre.belloni@bootlin.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:orsonzhai@gmail.com,m:linux-kernel@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:zhanglyra@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[amergnat@baylibre.com,linux-rtc@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[bootlin.com,linux.alibaba.com,gmail.com,vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[amergnat@baylibre.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[baylibre.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,baylibre.com:dkim,baylibre.com:email,baylibre.com:from_mime,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCE876E6D26

On Thu, 28 May 2026 09:16:46 +0530, Balakrishnan Sambath <balakrishnan.s@microchip.com> wrote:
> Use dev_err_probe() in place of dev_err() and return, which
> communicates the error type and helps debugging hardware issues.
> 
> No functional change.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Alexandre Mergnat <amergnat@baylibre.com>

