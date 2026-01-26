Return-Path: <linux-rtc+bounces-5901-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDGNGyqPd2m9hgEAu9opvQ
	(envelope-from <linux-rtc+bounces-5901-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 16:58:34 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 307918A6C2
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 16:58:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E016E3025A5E
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Jan 2026 15:57:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED278340DB9;
	Mon, 26 Jan 2026 15:57:30 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC7833F378
	for <linux-rtc@vger.kernel.org>; Mon, 26 Jan 2026 15:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769443050; cv=none; b=XCHjY4SIDPzB192re/tuxiw+VPoVgAULTzz2Jyx7I6P2KYem17FjoboDzWZVd4svIEmjFFW5JRuYzFv++79XCe1c+tT4Gqdx5taiI35OFE/WI5RSSSfcf2oHyCaZDvWM9ep0lPmlK1f8gqfFdVfviDbytAqCHVgn7WJddZypQ10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769443050; c=relaxed/simple;
	bh=bXHAel1NwLDuPGwtU7+OMOyzgPqVLj6MKMo+sEVl6lY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qc8TsRWhim+L87vvCBm9aw7aB+gt9bPqQANbTEZnaQkHSZBq535UM63I+xM06VFPpvBe0OP6uAiHedcZG1peod/LLhn6qC3cMfRIsHmmQ4klS0DUERcAyNmK096SA1Xca7tVNKWcAdSsdjGV++I0q3DLNQIk4u0D16itVGbSmcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9480ad20274so3714858241.0
        for <linux-rtc@vger.kernel.org>; Mon, 26 Jan 2026 07:57:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769443049; x=1770047849;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWlsYApapvL5A9IWANUoDMRFQZN+NsL2oKDWoPXwI+E=;
        b=FmaTXDLlLnRqr7DW8xP1t21g9YRWF8aE/OfAvMHCv2KQaCmzzlPMnhp0QQMdXsFWRL
         apLvcg6rnjeNONpoV6xZOVztry+TGZsWKPgzgmMxJG9w1eXQFNGIH7fmryYvB0oHjaA0
         o8zAneAzO/f2xqIaIg69KD1NDKq+ShAVjrPstT8XbNDoKCg0oKkzhN3nCC9B0aUGMfBI
         hzOVJMlfTBj/3A+Yw10GKmOVTmN7OFHMFNLdnzkQNLJ7xBE1frlmgV+vSMZ6uGc4V3iA
         WBh/LpEv0BThPBG2vvR9vz8XYP9O8TYvoQ7RwRUDBTobcDxXKKUYS29Cgu+3L2hwWPGx
         AXvw==
X-Forwarded-Encrypted: i=1; AJvYcCWF4QTxNf5jG4SOgZxsKASYURMw9eDhnTkZu0yJuJkpsx/qakUmQ2aN3P0fYPydEPJLkq198ls0m48=@vger.kernel.org
X-Gm-Message-State: AOJu0YyimdU+qaYwTN3QRDqUtvuUmMR2dHSeYBvlngnBjU/l6h8L27E9
	C0GrVvc4yyP91f5FtGZInluFngJpMrf2ud9sNABWS+/UzsbxAdXa2T0ovKUjFvyU
X-Gm-Gg: AZuq6aKgAEA0AFqsHhFR7aFYMuMGDEpwWCqu6dov6BL/wZYezG+S1LhEKhlSr7YGWFi
	wv1FciPl1f757bgVwBlwkvElrM9ZyVBcYMBbF9MVm8iepWC2umVKMO6FjicNFBXNrjx01oWSxwg
	A77Z5mPIoySG0dfRKJyMQ30eGharInyGahXHboXdzHvvRoJ5/vU8p1tSKDLeqKf/BIEpLXLDZBQ
	KyA87EyfCgSfQ+qibO1JfCp3QaM4Q4vGi11BdAVTxP+ytqJceU6axRz+qLixxP6wyHirNSiualc
	6awQtMuoF8kKpW9ACz0qvvQdgxgG7X4AZ1Hy5tKnDoeBYo2Bze8ILSgUYGm2JqIMDZsdWNie7dk
	L5UPsWKuogdcDBXH9lW6hxlNLaRg9XbmOgxWs+eomXjNpKG7yqzUstWaEDCKDouqAWEIU9hrfJq
	NfmJIAdLjn/FQIzcaX34ttcZ9qFEsGiuSft1vT2df7Q64nLL8S
X-Received: by 2002:a05:6102:3a11:b0:5ef:8ae:85a5 with SMTP id ada2fe7eead31-5f57630717dmr1664170137.16.1769443048704;
        Mon, 26 Jan 2026 07:57:28 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f54d3d8225sm2149441137.3.2026.01.26.07.57.26
        for <linux-rtc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jan 2026 07:57:27 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5f5418ec110so5163968137.3
        for <linux-rtc@vger.kernel.org>; Mon, 26 Jan 2026 07:57:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEPkQl0Hfrt1aZnrrLRhOZcprFqbTFGuu40EFZrwk98+w+CBXDdWx6xNZaFff4q8W+VnOEU7bS8kA=@vger.kernel.org
X-Received: by 2002:a05:6102:2920:b0:5f5:2ab7:cefc with SMTP id
 ada2fe7eead31-5f576514c47mr1614515137.41.1769443045773; Mon, 26 Jan 2026
 07:57:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260125192706.27099-1-ovidiu.panait.rb@renesas.com> <20260125192706.27099-6-ovidiu.panait.rb@renesas.com>
In-Reply-To: <20260125192706.27099-6-ovidiu.panait.rb@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Jan 2026 16:57:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVgn_hViAO13HE_AY7KG-guAwSMTMOdHwzzK+K=kUstkQ@mail.gmail.com>
X-Gm-Features: AZwV_QgRCwoHhziZOmAhSnKes9efiAhzVMELZ9SF4N6lYcHkaUa7uPK8VSG_D2s
Message-ID: <CAMuHMdVgn_hViAO13HE_AY7KG-guAwSMTMOdHwzzK+K=kUstkQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable RTC
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[bp.renesas.com,bootlin.com,kernel.org,gmail.com,baylibre.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-5901-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-rtc,dt];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mail.gmail.com:mid,glider.be:email,linux-m68k.org:email,renesas.com:email]
X-Rspamd-Queue-Id: 307918A6C2
X-Rspamd-Action: no action

On Sun, 25 Jan 2026 at 20:27, Ovidiu Panait
<ovidiu.panait.rb@renesas.com> wrote:
> Enable RTC.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

