Return-Path: <linux-rtc+bounces-6788-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id mcTjJHPeQ2rrkgoAu9opvQ
	(envelope-from <linux-rtc+bounces-6788-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 17:19:15 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 028A76E5DBC
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 17:19:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6788-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6788-lists+linux-rtc=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6611303D55E
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2026 15:18:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32B7A351C2A;
	Tue, 30 Jun 2026 15:18:31 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4409934404E
	for <linux-rtc@vger.kernel.org>; Tue, 30 Jun 2026 15:18:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782832711; cv=none; b=iJH5r/L+CNrJnUAuQFiCj3rNPK1raZvCnv389OyL15mroNi4IKUSq/JtnZEpgBf0fbGI/4ickyb7J1pAGmtw9ygNzcNB/cIr/YM2RhA5eDgWLzf5Q4n0oHhgAjxH+j1DTszWy8u0c299sksiyiKeVybJXnYdm4g+ujKEzWrhWfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782832711; c=relaxed/simple;
	bh=N/Zi+rWJkX+vGnzQXQfq1XW3GIG775X83OLKitFptWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KVYKHBkcHi2N6VT+9HQsa8AncDcmuz50MftADNIuAEIQDjs3OM9KVuliXnTf3owyQ/jbQqZEAbxau5AugHkqOPBL5qD1hJFhp6sIw0S8pcqUdS3oEJ69QxEj4RawD07DmlAtTMphsMARVV+kRUHBIj/H19bsPii3TetV0TRCkfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.50
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-691c5776f35so7163554a12.3
        for <linux-rtc@vger.kernel.org>; Tue, 30 Jun 2026 08:18:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782832708; x=1783437508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/KBEaRwzQxEmv419xD4ZZ9bpbQPWDLZFF8bQ7NEZ/M=;
        b=Qc9BBJzt2Ucs1bJgzv9IxbC3b/jPrOsfm5GbClz24073eG+HkrEhtMedxBQrswe5YU
         x6i+6NjMR2kmp+xg2gwxVseEDqvHxOnwNOv2G481ysNMq4zfuHLk32C1TetG7XM6AWZ2
         ZI7rhIxqhUgHN5JwKSKCSPOHtv891sFW2oTdI+BqTT+LxBsFiM8soXqVpQHvKVjhMu2Q
         kbNG3+fuG4hCps6zpnzA0HGLhBnAID6Hh+lDhf1SuHndltuE1eY9UjOxRNHA65OYBedp
         dE5mt3/yIk76h1/zLCaG8wt74w68KiLbhStewBzdQGh4JND5GbcGRIFd/tkoq4bizE/k
         9BPQ==
X-Forwarded-Encrypted: i=1; AHgh+RqAc1cbV98lOpcH9eSGMNWMYm/8Kekn3mB9pP+TtRbXH5YQ7h9toWHXxGoBs2uPSeGM5Nz9u3tKVjA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1C2ecl3dWle4S9Z6Ay0SAON+a5UdGkmYJZvrAa8ySmUk2kiPE
	bfChzhTtp0EBq/lyf1r71xf67lxIPvfYTLU1h05g5rtpYFkwoURaZh/nXjpBhZhY66s=
X-Gm-Gg: AfdE7cktef68s6zoHPtuXpqSAwq0H24JQu6S4qNW/pjIS4MIj3/eawHVs2ra6qx4vQn
	EcHZq4uirqdDIjQ8dJouA/WWIdC1/xlNAv5LMdWVrKCMeSigjj3DTPuUTeJRH5fqXnTkIJyqNo4
	d1WQ0q+1ZkrvHFpoAkgW8umgBOyyIO6VMWWzZsvlqvK+f56A3WX8+rQ232eEi/jpqpYoZgz3BmK
	7NFkQTczBEu72WvQlZsbCFSMtPxRTQLDVPnHSpf37rLju6a3jG4DYdsJK5EVoxfmmEZm3HjTNjY
	nD2e10a7nYd0CiICD++sWUoFtwF8e+IBjBow6IczSKoYPw4+vuwDagE7alQFFi9+Evh7wMwkDau
	AZtcO4xAqH9xCZ9FSdq6Y1sWFCMv0RZSV5h0X+YHcXsH7MMqks2/pTvWqDRSz1K25bxemqZ7Htl
	fTdVw8wgWACybUjsep2JgvjGp8WQeD3J3Q+bHWkDf3nJGfoWQiow==
X-Received: by 2002:a05:6402:370f:b0:698:663d:d7bb with SMTP id 4fb4d7f45d1cf-6988784b479mr790481a12.25.1782832707332;
        Tue, 30 Jun 2026 08:18:27 -0700 (PDT)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com. [209.85.208.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6987c3a3d9bsm1427701a12.4.2026.06.30.08.18.26
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 08:18:26 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-698823a9881so756773a12.2
        for <linux-rtc@vger.kernel.org>; Tue, 30 Jun 2026 08:18:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro5Bm4NWrI6kYaVc1UK+8EU9HjxXu636PYnR9Mc9F7pkqTRqGBK63qSrtN16MMmAp1Re8czv4vLTZs=@vger.kernel.org
X-Received: by 2002:a05:6402:4490:b0:698:48c4:361c with SMTP id
 4fb4d7f45d1cf-6988786091fmr817966a12.28.1782832706307; Tue, 30 Jun 2026
 08:18:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260513-panhandle-ashy-70c6abf84d59@spud>
In-Reply-To: <20260513-panhandle-ashy-70c6abf84d59@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 30 Jun 2026 17:18:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnkeantjtoMg+3unfP8ZSeG+7K+EGkn48=BEi_RWENwg@mail.gmail.com>
X-Gm-Features: AVVi8Cc1NkuZmAxV303oD2tKXfYtzTdOGchmD-0yx3VkueavnJtU938JZF73YgY
Message-ID: <CAMuHMdXnkeantjtoMg+3unfP8ZSeG+7K+EGkn48=BEi_RWENwg@mail.gmail.com>
Subject: Re: [PATCH v1] rtc: mpfs: fix counter upload completion condition
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	stable@vger.kernel.org, Valentina.FernandezAlanis@microchip.com, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6788-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:conor@kernel.org,m:linux-riscv@lists.infradead.org,m:conor.dooley@microchip.com,m:stable@vger.kernel.org,m:Valentina.FernandezAlanis@microchip.com,m:daire.mcnamara@microchip.com,m:alexandre.belloni@bootlin.com,m:linux-rtc@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-rtc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,microchip.com:email,mail.gmail.com:mid,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 028A76E5DBC

Hi Conor,

On Wed, 13 May 2026 at 20:04, Conor Dooley <conor@kernel.org> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The condition that needs to be checked for upload completion is the
> UPLOAD bit in the completion register going low. The original iterations
> of this driver used a do-while and this was converted to a
> read_poll_timeout() during upstreaming without the condition being
> inverted as it should have been.
>
> I suspect that this went unnoticed until now because a) the first read
> was done when the bit was still set, immediately completing the
> read_poll_timeout() and b) because the RTC doesn't hold time when power
> is removed from the SoC reducing its utility (I for one keep it
> disabled). If my first suspicion was true when the driver was
> upstreamed, it's not true any longer though, hence the detection of the
> problem.
>
> Fixes: 0b31d703598dc ("rtc: Add driver for Microchip PolarFire SoC")
> CC: stable@vger.kernel.org
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks, this landed as commit 9792ff8afa9017fe ("rtc: mpfs: fix counter
upload completion condition") in v7.2-rc1, and finally the endless
stream of:

    mpfs_rtc 20124000.rtc: timed out uploading time to rtc

is gone!

And no, it didn't go unnoticed, at least not for me, but you couldn't
reproduce it reliably before:
https://lore.kernel.org/bce2ca405ef96b1363fd1370887409d9e8468422.1660659437.git.geert+renesas@glider.be/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

