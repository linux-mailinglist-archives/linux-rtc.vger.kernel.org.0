Return-Path: <linux-rtc+bounces-3921-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C5EA85406
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 08:17:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1D44A1B8811B
	for <lists+linux-rtc@lfdr.de>; Fri, 11 Apr 2025 06:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01AA51EF0A9;
	Fri, 11 Apr 2025 06:17:18 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BBDE367;
	Fri, 11 Apr 2025 06:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744352237; cv=none; b=kZWsa2LV0aABApRqg134buOlk8YaYRysapAhzqUzD8H4RLkJlrHhWGDDMwvU8vpGVCWj+3XMqOEs8XgURNG9u/sDtRihwzH+lSfsxCKxG0biSR9Q0HSq0qslQo8lhw9UHJR/5dP/GgoR8glLc4x/nPOFMTxjEwQ64p8/SsHEEJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744352237; c=relaxed/simple;
	bh=wOykkXeI3lB+JRopx8n2XVx0J2zK3iE1ZQoKSn7Hecc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RGwmihUWgEWit6nNvsThNInlUimFzLbqI/J4+JE4Vd5ytvcMS7+oQ+pKueZ0QEvQDKe1T4BkTxjj5tIIagXllZYa3ok5iCl5GHrzup/y2OXzM4lIUN5TltV73BY3JlLxFxjxddZSsH4A7vISSe5X3rXG1zWHYhlH22+mq3iDLFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e686d39ba2so2968157a12.2;
        Thu, 10 Apr 2025 23:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744352232; x=1744957032;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ucarNAF+1BzDZMRExfkLVaJ4leEZtBABGIBsOA7Vhqs=;
        b=YoqquoT77JjWwvP5jPlUTGrWwmDDZRYeKPYdJRE77bJMykLLpYEBsPHgvCFghES6Wb
         v44oXnzhZhhtnnRlgC2BHnzPwiIxROYhdNFSlEEdF5oju5eGLcholi5kV5YbIp0QUXre
         u2Hjx3fKRitNFfXlW+tERc/WtndpO215xpqtyDnIXrmNcSu/xneIgdlDicfQJt+wqoAt
         L8UaHuJii3cNOMJHIroHGTznu95R/KDSmzvyXf5pXl9HAMOZc/9AhLwWtee49pvT7dxF
         ELpM39NvZOnLPyBdtTDw3R8YXxbA0/jBaw1KJ1yfzxmbZhgkqVRgf4MzXcgOR11DdIRh
         e6HQ==
X-Forwarded-Encrypted: i=1; AJvYcCXm1zt1xOi/eto0h2qg9OR5aSHAOOqk9PoW1lCrSlatMXfzIwnfZLh8Yw4oHTvTAe7G3DH8mzL0Hdg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTWBnOVHK9JaDUMosef8jcHsNsmD02jfNvMD6dQJFoAB0TaPtQ
	R1fmnyWKcWW6mZPDrlQiW+lTVv2QzKZLOzDnhYnl0FncmaB5H9KCiIyMuqXrUOA=
X-Gm-Gg: ASbGncsqfa7MAjHr1wH7wXVgsxc+8FStAwT8mcmx7lOwywtFr9K5ziAaUWi3nwtPp2f
	vAkv36zXRPCYCX+wzysy4AjrI0v0T+VpHu3pr5wmDkjIojtjYsRCQGDYGKfO56h92sJ49jUyYZP
	6gLaPo9wDHpFTCdjlVp8ao6n++Q2V/KMeHdLmGHaitpiq+VPdfYD9n6EcYeSif2eZ80f7lCdYX/
	ihs4lTnLPU2CB1f13l9g2Y6Tqqlasq4VrqX91kOFVPK+mNYY7XkWSAn9EQLwtf7VXm+sin1LRwS
	ArglLpEvB0abQFXw5o0vmKs4/MtbF190TGodAWMG3DxODKCHh8MDxyj50e1djthj1ymkuXWIjSM
	7q0c=
X-Google-Smtp-Source: AGHT+IG/+9Qvv01FEPUH9ICQGbCluUHPtePxBn6rSbxpDWcVert/Q/enwUjVhS4FSuy5xjTvkGMkYA==
X-Received: by 2002:a17:906:f5a9:b0:ac7:805f:9056 with SMTP id a640c23a62f3a-acad34d9ccfmr129424166b.32.1744352231701;
        Thu, 10 Apr 2025 23:17:11 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb4129sm397757466b.98.2025.04.10.23.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Apr 2025 23:17:11 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ac3eb3fdd2eso313794666b.0;
        Thu, 10 Apr 2025 23:17:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVjEaRMfOxTbgHUiQyOixTLajXGC9IKvT2wRf7H2vrQQ8lZZARC/8hlfafmnvBKfSbO5Cn4i4w42Mw=@vger.kernel.org
X-Received: by 2002:a17:907:7215:b0:ac7:f3a6:5af0 with SMTP id
 a640c23a62f3a-acad3456f7fmr109361066b.10.1744352230706; Thu, 10 Apr 2025
 23:17:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319110305.19687-1-wsa+renesas@sang-engineering.com>
 <20250319110305.19687-4-wsa+renesas@sang-engineering.com> <CAMuHMdXMPnJ9b_5gZ4SwCAeuHUTr3y92+d94X=os5HaYis1CTw@mail.gmail.com>
 <Z_glj1NS6yRHHkyR@shikoro>
In-Reply-To: <Z_glj1NS6yRHHkyR@shikoro>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 11 Apr 2025 08:16:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVnu3+4Gkca0nTp7nWFSX7RjXe_GRG5PKDShC-WdpMSqw@mail.gmail.com>
X-Gm-Features: ATxdqUE29SZOxOW4YgZBxWM5ECUAGY2K8QLa-TxXKckULOgWySkZbYNpJUL5Jco
Message-ID: <CAMuHMdVnu3+4Gkca0nTp7nWFSX7RjXe_GRG5PKDShC-WdpMSqw@mail.gmail.com>
Subject: Re: [PATCH 3/3] rtc: rzn1: support input frequencies other than 32768Hz
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Wolfram,

On Thu, 10 Apr 2025 at 22:09, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> > > +               if (rate < 32000 || rate > BIT(22)) {
> >
> > Perhaps
> >
> >     #define RTCA0SCMP_MIN    32000
> >     #define RTCA0SCMP_MASK    GEN_MASK(21. 0)
> >
> > and
> >
> >     if (rate < RTCA0SCMP_MIN || rate > FIELD_MAX(RTCA0SCMP_MASK) + 1)
> >
> > ?
>
> You really think this is more readable than the original code? I am
> really tired of bike-shedding so I don't care much, but I do wonder...

I don't mind the literal 32000, but the "> BIT(22)" looks rather
obscure, IMO.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

