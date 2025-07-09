Return-Path: <linux-rtc+bounces-4445-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E65AFF160
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Jul 2025 21:04:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD30818928F4
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Jul 2025 19:04:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FFE3239E83;
	Wed,  9 Jul 2025 19:03:43 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE5423C4FE;
	Wed,  9 Jul 2025 19:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752087823; cv=none; b=HCvVXDTKngphVm6Qp/UJstG9v0pPap8ZRWDGJaYiCTHAfsNDR9T3XyDhSOxgbf5bHnEx6DoR+kUEbKSCeE3lmZcMhb8Pum69ntmOGVrKOGgm67QLGmb7E35Gto8BEmZmV3JvYEAbNrNGcb2JVHx0AGOmlSLzkpxRbUFxi7mH4Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752087823; c=relaxed/simple;
	bh=dbQ6yFQ3FFviBApF8t06O+SuXNB8Hm+OERWMZU9Z6oA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DxQ6hKhV4sNBjaTzvENPquDlLQnLWmSIPBkO051scEhpAsd4pN+omU5kRxvg4XvPJML2/EV5L8qRmC1g5Fr8T8tY+xtm/QJGEgnJvTb+RMc4qdCUDqCjUUq3qCdKum34tKEmjpiEEw1T1lPFbYbideyfauKmpm7Tf8vOOnh6zPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7d9e2f85ab4so19418185a.3;
        Wed, 09 Jul 2025 12:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752087819; x=1752692619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IK7wLEDDGqAnvkVp+22bCllHhK7jta3H8Yu04LUbZuI=;
        b=SSfBl7YGOWJQqlWrUMjvz8xIw2i1P5JZsS7+UAoK3gw5BQcHki6i40fFj6VqIRHvNn
         ALnX633bvNrZarvq+mWcYlWD7ItsnvClpIky7+h0PcHb9/IH2uFZ1kGIUvHI4AoTuDps
         nQ95y/qQhBAtdxnQ3BrxOnON2oyk7vSqzgEGgOW1RtMq3Z+ys0I8/AHHdseHtRfuoSkb
         M19YSSxK0Rz95AX/6nsOfWz2uLuyhasP09RZEcnANk3CVUOqOcc2W9WsY5jYVEQM7CVU
         xuxqA2qo3vwRgPNmVLDzVZyDERdacZ0jmKSPOEbmiJMoy7nn/6TorpWm4gCSWUtZ1dCF
         AJkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdYc1z8I85nJxkiejDjsIkwM9QQBSy7qJ76vLELA4StXavO/vXSxqFMyDgB8P2itI71AU9NRDqY6vrvKSw8wMFgw==@vger.kernel.org, AJvYcCXu/flVQqAvBZz86HJnlxQLhG5aqjLZmaXotJCJuWk6Bk0eGDy9jtix6mRx2KMRgPn3yhirNQgb5a0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiEO4u9lTYNYVDrNlJN1Hhe932r6FnYQ7M/V0ra1TDOmcuMkA6
	EfQmvKl/oUamZm3Z7FRaSWquz3dHISie4zY89AwNFYQHW614EmTmxkmDeL6TE9ar
X-Gm-Gg: ASbGncvzZUTuaE2qE2HX2sUwpJHLte+R9zhqal5I5aR9cmxSk0CJMbjRO1twdl0yPHj
	4cCIauokMRGpWUfKJqRgE1a3S+yz+tBRCeDTciKAUFCQyGMrRWNmsUPQw6YoOzTovSHBhsxiHNI
	+2w8yuiueNmpz+bBzQDbpek4lLUPM0MdnpIABci9BW646cG7dfvUrFy8rMwodUbuVpoxBuDTJwx
	nuGTKm/OrfJ3sIO3EYUlNPIY2WzeEmauj+lqJtR8jcuBJd9VIqtWBMYmR6w0XTgjBS3vHlz3AXs
	vs3cLOcvwqHaNSNYSV9JpLSxcaP8gd5OAZhP2Ghoj1WSQmro4EMmczb2XwF/OaCs/eG/MiXYZt9
	logxCYX4+A6C7sDiWIwHhb8G1T+DN
X-Google-Smtp-Source: AGHT+IE2BgxSmZCy6nQg5MTycOEYc8g5e0tOtUdahtxSq9INAerGmgdKSFRw1hopwlI3M/S/GIfGCg==
X-Received: by 2002:a05:620a:f84:b0:7d3:f15c:ee33 with SMTP id af79cd13be357-7db7b121192mr414504685a.10.1752087819188;
        Wed, 09 Jul 2025 12:03:39 -0700 (PDT)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com. [209.85.222.169])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbdb73e2sm977765885a.36.2025.07.09.12.03.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 12:03:38 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7d09f11657cso25019085a.0;
        Wed, 09 Jul 2025 12:03:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXDwYAvKzb1VND3lcZO1hELfVyRMcGJ2M6zhKLH9oYAv7wlgR5gpf4SBPv2YrMY+glKwOl444xuojwgV6t8yt2gug==@vger.kernel.org, AJvYcCXqcaAJQNEhzTWRqldK/vxDNq9wguWflvWSop/lZyPJ6788Mr/n1J4mZIeJRv2Y4naFRsXtZCGq5n4=@vger.kernel.org
X-Received: by 2002:a05:620a:1a95:b0:7d4:1e5a:95cf with SMTP id
 af79cd13be357-7db7d3a58d7mr548228985a.47.1752087818534; Wed, 09 Jul 2025
 12:03:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a5628fe028362ae3f8729021a7864dd39f7869bf.1752086885.git.geert+renesas@glider.be>
In-Reply-To: <a5628fe028362ae3f8729021a7864dd39f7869bf.1752086885.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Jul 2025 21:03:24 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_PgqFyYczf+bsJ6BLRtQz65zkjw+H9Whoct49GEfrNA@mail.gmail.com>
X-Gm-Features: Ac12FXxfid5XamUE-HLX9WyHBs5ltMj3xKDA9nzEEuoscbbx6cV3FOZvwIoRmc0
Message-ID: <CAMuHMdU_PgqFyYczf+bsJ6BLRtQz65zkjw+H9Whoct49GEfrNA@mail.gmail.com>
Subject: Re: [PATCH] serial: sh-sci: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-rtc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Jul 2025 at 21:00, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> Convert the Renesas SuperH SCI(F) serial port driver from

My apologies, this was not meant to be sent to the RTC subsystem.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

