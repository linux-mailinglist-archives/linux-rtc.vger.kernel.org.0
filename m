Return-Path: <linux-rtc+bounces-5120-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B691EBF6CF7
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Oct 2025 15:36:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A10F44649C1
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Oct 2025 13:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D4F3337B86;
	Tue, 21 Oct 2025 13:35:29 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC6633890D
	for <linux-rtc@vger.kernel.org>; Tue, 21 Oct 2025 13:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761053729; cv=none; b=IHVkaYhbJ4su5R1rAB297ZCVhGBkP2hF7Y8aqrzHzhqM/pHhDLDSZNJQ6Q6WSZdenNDv+9wSl2ev0m51XQcusRLQ6u1ugnbzNShM/vdvVSECa7yI7h3J+w63ZYXyFL1zDYLyMD8dBH8J0XTQ+FQs/28KQtwN6vk63QUkM/XMMrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761053729; c=relaxed/simple;
	bh=gnF9AkJgPkgv+c5e70+0S/TuXUz2qGPWDAKnDZ2oFUs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l7IrFFYjtkUHHX2j4dB2QlKKTin7NFI6tjkmWZMxsvs90xU7JI13sOgRPfFBe1OBYll1DJWaXuBbWSabw/XH8dBxh7iAIExkr1JNGhWW/MjKMxelB6skxJWXX3xyKqjSI+YwgDBTUW5cWS4/x2MelO8VVOFkfIQlPcowoR9cfZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-54a8f6a2d80so1998106e0c.3
        for <linux-rtc@vger.kernel.org>; Tue, 21 Oct 2025 06:35:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761053726; x=1761658526;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TkKqx+vxrv5wCaSsuSiP+PuBVA5+FMh9B80POq+sr0=;
        b=YfzUKltl+T5nHf6BAe+wPrETmWghGL062qGmm6g2MbBYCLa0FUFuw9HWL1U0coNp5g
         Q2vqKtzLxzxTLQMxTNaHpg42vNx2NJXahxv7oTMNJ29XShkq3kvvIQtiEYcC4V0iZb2w
         2Kxx+LaXQGTpYN3Ut6mgZvXrbG4Rn8UegIcRC00wiu4cMKpIlstuDGMfoveT7QS0nMbx
         TVWXAGkbAg+ITiOx0yabwkY7aMUGnZ0R0K0aGj5rjwindPgCPY1X5CTQgVMEiocKBVZP
         UgiQ+QPKMfPSxSLEpP/HLLxDDYQ1vOqaJW+kSSb5r5LMk3uY5Qspi8imYAjPX4Fl+MfR
         ENQA==
X-Forwarded-Encrypted: i=1; AJvYcCXDDW2KDAUMlfavmv15bdqxN6+w33IPEQFzAVM4oUf+tdElLNcwuraucO3Jagt1Vu8p+YdagmzRNgw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfGZEHwL+aKGIuLy4QJZOBBEz3a+LuBpSK6CnD5yGFiLcRK5aG
	eOWHq4+9k9v5OWGMLNaXd5dcIbUpG3zksZmrCKSuLWe71p9jh2UMHYebinULt37q
X-Gm-Gg: ASbGncvcn7N3/oz3oUPQR8rVyIYNX+ActKCJzSxs18/gBAGydsUlQp1+DO8b4ZecwiV
	g8W69mMZUo5vD5D8PBZ6W0mDK3J8m/x9UHZYVgrpNvI5Hbic2Fds2qIhdA2T+6gKxIdnlus6qWG
	yJrp/LCdz5CokJr+KLFovF/p4hl43yPE/tccQyFJhTys5j146LsWcOj1WMpOf29QaFlK93S5dN/
	LeeoSK0Y/0FbNZxBcTt3DpLo8Vky5eS5gzWRAgD6/ixzJ6zYpy+TThfwQOtGdfRdAKW83Or9qLa
	0ioew7SPcxMQ1uJ29yYD7fHjnv9HwalrkjxjMqsicOVOnm5+ZVocbcIOKi/K/zmGCUKlXRZxX9D
	C+GdhrqJJHZHmmt/qHZMaPAZRJWuKHqT3VCzUHfnlOhtdWcs+rKrewnLHiqspoC77Cqg6F9bICA
	PulaAGoa6BmJhf3gw9hhcacGUkh+aUJvkTIrdifFMckqA4i0Mw
X-Google-Smtp-Source: AGHT+IFjXXIJTNz74ORp8fw1SUCuvxPImq6Asc++QNYRIySfkFKggSzHscRopjGdv+UzuKqOaW0CIA==
X-Received: by 2002:a05:6122:54f:b0:54a:a048:45a4 with SMTP id 71dfb90a1353d-5564efad5demr4691955e0c.16.1761053726317;
        Tue, 21 Oct 2025 06:35:26 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5566211708bsm3342000e0c.22.2025.10.21.06.35.24
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:35:25 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-932cf276843so647140241.1
        for <linux-rtc@vger.kernel.org>; Tue, 21 Oct 2025 06:35:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVI5+I2B0hDcSkTA8oSRwtxN5GekiP0ieqWeBUR+0OVaCMvXtCmFcEy2tImf60vzRBfzdXuroodNNI=@vger.kernel.org
X-Received: by 2002:a05:6102:390a:b0:5d5:f6ae:38de with SMTP id
 ada2fe7eead31-5d7dd6ba33emr4614068137.41.1761053723732; Tue, 21 Oct 2025
 06:35:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021080705.18116-1-ovidiu.panait.rb@renesas.com> <20251021080705.18116-2-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20251021080705.18116-2-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Oct 2025 15:35:10 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+=c-HseXicppm+185qq3fcc7=qq3Nu4LjoKZuYF0d-A@mail.gmail.com>
X-Gm-Features: AS18NWDE7aRGEcmYizQFJmtQta7msQIG0JXTbcDHGFqFLxinOoGCd4ViST3rwwc
Message-ID: <CAMuHMdU+=c-HseXicppm+185qq3fcc7=qq3Nu4LjoKZuYF0d-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] clk: renesas: r9a09g057: Add clock and reset
 entries for RTC
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	p.zabel@pengutronix.de, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Oct 2025 at 10:07, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> Add module clock and reset entries for the RTC module on the Renesas RZ/V2H
> (R9A09G057) SoC.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.19.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

