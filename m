Return-Path: <linux-rtc+bounces-5897-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AD2jM0mJd2m9hgEAu9opvQ
	(envelope-from <linux-rtc+bounces-5897-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 16:33:29 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4067A8A2F9
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 16:33:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FD1D3050D1E
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 15:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CADB933F375;
	Mon, 26 Jan 2026 15:28:12 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596CD33506D
	for <linux-rtc@vger.kernel.org>; Mon, 26 Jan 2026 15:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769441292; cv=none; b=Sdi8Qpv++79XlZKA1Pf7/NYlLZUyZpWJQhZy5QRL+QeC/EGI2MZsg/AORy4Z6n4GHI7yWoEnNW/6kM1t1dBeGzYuC1BX29XH2xvEynwzSN3LOglNNTodGp1JBoWZhvC1F4JbFhwIXDWTqlkriPh6ATnlUpemTrLuL4UV9H/dBhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769441292; c=relaxed/simple;
	bh=nTZYFAn4zz6jIv7uFk83h22IU8Xvf0ATPw3U8GxauAE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rm6YS93zR50JxTppIzeG9T/mbrv/Grj4g32JfbMFNWxKcif81GfCRNZqaNffvW/MZkhkzSuypY7P2JfuNM3o5hE+iCTr2+oouJ1ITqzSfCm2t1hO6FyE34RRoWH62bjNPBqn2XKIcP3IgPzJxNi6i8s6h2c07rDp+rHPapYmErA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5f52b3d98cfso1661543137.2
        for <linux-rtc@vger.kernel.org>; Mon, 26 Jan 2026 07:28:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769441290; x=1770046090;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BqPSDhihrPdf4Khj2S8qKHDF644mb07LvFd5WqEIjGc=;
        b=Tx1DJc2OK9iK11u5MewGaty6pRNyBRw3ykVBd2MGexswhZTeNq/kr8XTNYyGJFwZat
         0FuNKeAdJ8f2Vau7bIBiFRUVoDt4l3juJIOaUvSKmw50wxqBy5oC4ryK/XFLaY4GtD/J
         N6h/kY9pe94dMesN3UfUt4kTrOgIbpoBjaUYPIZ+JtBPmDIt84LYAl5oPlj8G9cxlcH5
         ymYAM42mPNjhSfSYnvLieZ1n7GFT29MBRQkFYddJDpnNCrZ2vvQjhrcgjoZhDYmz+EI5
         J+u/THnVYSHaTQDfM6gDkGSLvFl/Hsl3M4YCfwoSvROv9PtTJeYpadUxSg51N7InnLcV
         Swfw==
X-Forwarded-Encrypted: i=1; AJvYcCUV3QhQgKIUEd/K6yxooBX48jm0v1WB3q+HIuOulTVBUHNbRTmXFsQdXzH8Oc8tQM1f8sJckVL2QCs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwY4al5Lc4YcWMbQT9tDC8KvFNretkqcjrKKr55uDWD7OfYZ6d4
	aO4IHGenf5qQEvGAHF8hGpROPNJOiMY7i/iGEWndc0skJhQO98YWbTO9UwOOyGEG
X-Gm-Gg: AZuq6aKkGbzPXEghQBtFVUbrSqxKmUsCga8ddBiOVK6ruhuheVMDNtCXV4kb4KWqLa0
	gEbedEliqVCYfJD+Nl64jvf/8/dfnIuHFHZ5TIvkXosC7gSkfdiNS1t9JwrXZkkMmVEYFppra/b
	AwmhkaKz4UJOrASExwD+0jQhxiNNb0ETzO8hC9d7uwtGkCIesisq1fQVqnlEEKNpBh0jYHWo/XQ
	7FnJcBMNIhmsDpK734WkgjHRWzyZ9Kzep1VOukY3VpuhzpySJMJDnAtjckIxWDLMl35hQAuCvO6
	DWOVUB/QQmnGqnQQGt+0kh+vLwHuM9g+ST/K1B7+Jgzrp5L7X9XAvwb+AmnO2qppP2BEjU2JdPp
	iK/y4rGiU88x85y6THSjOhHwPp1970UMpm6GZ5Aul/SnsdL7DbPyPaETki9aBMPsxEd+SjO7cav
	00ZAYc6v+bbM87/JuN1TexQMlhTt08XkVTRqh39xjJvmVajzVlMxsG
X-Received: by 2002:a05:6102:32d1:b0:5f1:c472:92dd with SMTP id ada2fe7eead31-5f576356649mr1007538137.13.1769441290163;
        Mon, 26 Jan 2026 07:28:10 -0800 (PST)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f55118c549sm1796980137.7.2026.01.26.07.28.09
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:28:09 -0800 (PST)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-56635de8acfso943325e0c.0
        for <linux-rtc@vger.kernel.org>; Mon, 26 Jan 2026 07:28:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbgrvi1YaWf/WsFhC3QQn+/6ERbgeMeW1sEhw+Tc4PQcnAA8rdgHOrPMxsJzZecaM6K7helNxwNrQ=@vger.kernel.org
X-Received: by 2002:a05:6102:e11:b0:5d5:f544:a88e with SMTP id
 ada2fe7eead31-5f5764f908amr1370657137.35.1769441289411; Mon, 26 Jan 2026
 07:28:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com> <20260125192706.27099-2-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260125192706.27099-2-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 16:27:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWZKUjptQCqe_DK3C_g5d9Zhp3r3j6+dAfE1g==NH+ofw@mail.gmail.com>
X-Gm-Features: AZwV_QiV_Vg-viwqsMsGeXuhl8oqSRausfwmVq5_XCglJk6EVp0gGv8dhCY1AvE
Message-ID: <CAMuHMdWZKUjptQCqe_DK3C_g5d9Zhp3r3j6+dAfE1g==NH+ofw@mail.gmail.com>
Subject: Re: [PATCH 1/5] clk: renesas: r9a09g056: Fix ordering of module
 clocks array
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, alexandre.belloni@bootlin.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-rtc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,bootlin.com,kernel.org,gmail.com,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-5897-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-rtc@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,renesas.com:email,glider.be:email]
X-Rspamd-Queue-Id: 4067A8A2F9
X-Rspamd-Action: no action

On Sun, 25 Jan 2026 at 20:27, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> The r9a09g056_mod_clks array is sorted by CPG_CLKON register number and
> bit position. Move the RSPI 0/1/2 module clock entries to their correct
> position to restore the array sort order.
>
> Fixes: 1f76689d1715 ("clk: renesas: r9a09g056: Add entries for RSCIs")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

