Return-Path: <linux-rtc+bounces-6632-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ad2rCMJiJGp/5wEAu9opvQ
	(envelope-from <linux-rtc+bounces-6632-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 06 Jun 2026 20:11:14 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F4164E008
	for <lists+linux-rtc@lfdr.de>; Sat, 06 Jun 2026 20:11:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=DyTj39YO;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6632-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6632-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DE79301E590
	for <lists+linux-rtc@lfdr.de>; Sat,  6 Jun 2026 18:11:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC7E3AFB06;
	Sat,  6 Jun 2026 18:11:09 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649D3384CED
	for <linux-rtc@vger.kernel.org>; Sat,  6 Jun 2026 18:11:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780769469; cv=pass; b=PSLGegZV7w1enStA2qBt4ZNZkJanAdsJkM9Qf1gLs6PQZYI9KbZbWw5f9onaEgz45wEAFusTbsL5m6i1RBz4wPx2a/ED92+vKakcH+6PGJEP3ueSnYgLEK/RkJ9CBY5WNnXrFEyNk+kh6QFaWvs0JYWh5tauSpmBPBNEsdhRiEo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780769469; c=relaxed/simple;
	bh=g1Sr0VV2Gjr2KczGOo3OW7moNzxZ++f8NtW3I8eGzCI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GWLz/mxp7nip/KQWF8tOmdKTPjSNipncKGft2acuBHEziZnjzkNTBXjnfx4LC6KBxh/as0+RFvZkbn4KDOAw0LcHIO4UOqbuJVgu0robdJ2ueyXMH9u5QgdmzYS6fjq3TV+l0g5uzEnZBUeJQ+NV4y+Sy9iBJ8lJ80nQZLUyvjE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DyTj39YO; arc=pass smtp.client-ip=209.85.128.180
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-7e0aa486af8so29031107b3.1
        for <linux-rtc@vger.kernel.org>; Sat, 06 Jun 2026 11:11:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780769467; cv=none;
        d=google.com; s=arc-20240605;
        b=bwdm8imKsZNIHuMkOxMH2bIqpNrWGSqmGpRnLIeOt+sg9vDcZhVbH+5iPOws/VjdON
         vtxci6MfXJ4mWiXVKjJxz2sX64emthPMVdevedM5t7mHzheIk0JE0Xnqdu895lv886Fk
         pr7BvbpPXlnqQLXtiw4RE6BR3IYWgeqqAkpZBZD4QpkJcBeMOMLzShJre8H1VGZLYwvu
         d18Het6tWaeOSidThj6yBSvp5PREK0dCsN59C1pNn0nOhtrROa7RB7pe/WAM3Zk4je1i
         UgY5wqdyLnxie7w9XKFYQ402MYRnU72jucOC9lIMdCo0LI4Se9+yhfU7IHXphHC0eWuH
         UZ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=g1Sr0VV2Gjr2KczGOo3OW7moNzxZ++f8NtW3I8eGzCI=;
        fh=2tp+bgLlkGsUiOrHRlHK+jMDmxSa2y+2M9UD6H63hJI=;
        b=G0P2oas5O5j/gy5vLm9U8CHXQc7I2ERYPbtVLDiSamPaUIp4Z2zZdWWSTg/EDXrGVp
         yWT16GsIxvF9wmt5h8g4EIZvPG755X7Rxiw/r16B9E4o0KhQrp46LxEYue2OcJnDFO0U
         cQfomGXfDhzShaPspc+O+/FyxSMKkWWek/2M6MpdMNyB2E4Nqb8xwWFf6gbiCH1cRaY+
         ZgnmBpewSX3ghwxJZukH8OBWSxvYx74anwKCWhmdVkIaQLfiGgKVdcHcu0gQ/6uW5jHD
         TVrYgYsiuaUxnZjaxzmVmsdabJiOqjHZfPWYM2hjhzc/R05YcZ70fAPC5xGZclwKnjZi
         7TYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780769467; x=1781374267; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=g1Sr0VV2Gjr2KczGOo3OW7moNzxZ++f8NtW3I8eGzCI=;
        b=DyTj39YOkw9t90HL3tbwMbOW4P4oNp3qnzCgSpWsl2dBUIgN/PP5+0rMsLTlJGKTZW
         sNir0/NuCBD7Bz4YA7nz6VoFVjeUoRaWeWiO4I1M5pGiv43AEpKiGjMd9He32U9ykZ9H
         +FzjrfL2UArQcTwuGJeUI3ON/QA9lgqxEGkfpgHkrTdhWBu9JWJM+gVIFfDrQVJcXXYS
         /XrITCgVfwY1exreYHnrwfAupY5BAJKPodJe1YNgTb1Gm9Kk/846tMC8QMybH16kWwJL
         bbHyLzmftZNuEBTcrO/8gzqCA0kGLW1U7EPpkmM8T1T9jJ1GIAezndBz8LzqsoG2NLxC
         YIfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780769467; x=1781374267;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1Sr0VV2Gjr2KczGOo3OW7moNzxZ++f8NtW3I8eGzCI=;
        b=I/BIHlVnwwlEpE23A7iB+QLw+sdci2/wUdd9K9RGl010hGXTtgs2kTaZ2SXD6+AQ1/
         NlUgun05zAMIdpeT08okCRH+UNy9SvOdwN3b+ZvP0RHW0Yx6Hbh4xYWuKOU9cstXwyiX
         7G7A4CKyyUjLBuiEQLF/uumUE/U/SF13rnp5aQEYTem+/0Y+UfUZEWyN6P32n+0gOsu3
         RkOj3fTMNtD55QXbWF9KxUjpU/a86Z+lHk3xRQH68bhM3zVg68+LD2lp740SXpp3ZMdU
         DTQqR7NAx+4eJHowThGHPSJohs0SUMFWebSn8JNit2Apco43b7jubm7swunLNMt9NwPU
         MVNQ==
X-Forwarded-Encrypted: i=1; AFNElJ+vkug2S/fHp6xgogTiyxVEemrbuyOzmDg8sVr3dEpQxHzJsxiWPvqkVOcvTle8o19BNz5QLbzLOGc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2atGcOQWDxLsSJ6q5KrCg3sebocQblREo/D8Cb/EjgSCtTlYq
	nU6mxnWvtZV6M3X03Slpv7t3ll6T6TurpRjLy+qvx4X31kCQapP6NyWOSGGc8RqDHzvm+rG5z96
	x2aNc2QUBEoUnVw0sqCjH4nc0G2yaWWw=
X-Gm-Gg: Acq92OH29oY0LI+qhZs9EURaWWLJtUKjRDp12pRidVWRgn/Z4KVG6paGVAJ8Rmkb9hA
	9fr0v6xAVT6+TFQL544gBt/3TxUwY0RUY4noTSb9Gt+Dlh8iuVxNRiMkv69F50G+BgBCdMWle97
	N3L1C1OAuAt+idaAE90AJFVMond7onk3GHmA1Qfjdqw9ZKLlMcszsn/73yr85j4vux1agZmA42s
	9BdwPsoF0Xoy3JJUmEhxIpHkhEmhadB76ei2j249SFUYtHM3oAjVzJJRxST89/1NxW7Q3xTk269
	qElctUfp/dON4fnIeA==
X-Received: by 2002:a05:690c:4426:b0:7dc:1c56:2901 with SMTP id
 00721157ae682-7ed5028e9b9mr47127027b3.1.1780769467287; Sat, 06 Jun 2026
 11:11:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260531171041.4149-1-challauday369@gmail.com> <20260601-zealous-loutish-termite-ccfc8f@quoll>
In-Reply-To: <20260601-zealous-loutish-termite-ccfc8f@quoll>
From: Uday Kiran <challauday369@gmail.com>
Date: Sat, 6 Jun 2026 23:40:54 +0530
X-Gm-Features: AVVi8Ce7u1p9uE7h60hWReuv8ATRkce56Melx_UbYFY28UGi2pRVU4y3Gq9-E8U
Message-ID: <CAAj-GBkEVOUgGxXZHmp3XFbvKD-7sDaVepWoGzij8y=gBciMOg@mail.gmail.com>
Subject: Re: [PATCH v5] dt-bindings: clock: via,vt8500: Convert to DT Schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: alchark@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, skhan@linuxfoundation.org, me@brighamcampbell.com, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-6632-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,brighamcampbell.com,vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:alchark@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:skhan@linuxfoundation.org,m:me@brighamcampbell.com,m:linux-rtc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[challauday369@gmail.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 73F4164E008

> > Convert the VIA/Wondermedia VT8500 and Wondermedia WM8xxx series SoCs clock
> > controller binding from the legacy text format to DT schema.
> >
> > Signed-off-by: Udaya Kiran Challa <challauday369@gmail.com>
> > ---
> > Changelog:
> > Changes since v4:
>
> My comments from v2 still apply. Almost all of them.
>
> You a PMC binding and preferrably all this goes to that binding.

Understood, Krzysztof!

The current separation between the PMC binding and the clock binding may not
reflect the hardware correctly, since the clock controller functionality is
implemented as part of the PMC and all clock-specific registers are offsets
within the PMC register space.

Request you to please confirm on the below points to proceed for next revision
of YAML conversion.

1. It will be a standalone PMC schema (`via,vt8500-pmc.yaml`) which also
describes the clock-related child nodes and replaces both legacy text bindings
(clock.txt & pmc.txt) , or
2. As per Alexey, PMC compatibles should be expanded to per-SoC values.

If it has to be expanded to per-SoC values, can it be taken as separate DT-ABI
change or should be done in the same series now?

Regards,
Udaya Kiran Challa

