Return-Path: <linux-rtc+bounces-2894-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B7DA0B3DF
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jan 2025 11:00:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 856D87A517C
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Jan 2025 10:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6B71BEF98;
	Mon, 13 Jan 2025 10:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="jLk3t6gx"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF85F125D5;
	Mon, 13 Jan 2025 10:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736762429; cv=none; b=uAGTdxSh3zDQKdiII/atVL2ZuBZOR4sMNN5fLGDiws5EGER5ROZsDsH1Mm+TCFE0nCtW6TkLAek2WCl2Jnr3LCe1cDz/mH0CtECqMy3Q7EXD/P1y+p7FHeS6/EuIY10EGn3rxU3c9IYsUnDzahPzzyYANF4ljHJsSD+Wav0mqwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736762429; c=relaxed/simple;
	bh=Ub/94iqOVorkrcjA6UTxKlCrL23uaVzed2zRkWz9c1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/Uz5lWs4gUbmNUkzagYAGPTZtu+RXbGU3DLvqprJvkndu6eqMN4cjdJKPeD/aGN+gvxt3Ucmkzz6YRcV9i+nkHX+mx7ArwQ73IyElguqQAFAgNF5/o40U8qGpwPJiTysIeA8Rlv/Ys8pLt28oaufsksYDCmLgFTV0lj3O9mpHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=jLk3t6gx; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DBC2E40E0288;
	Mon, 13 Jan 2025 10:00:22 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id xRonFrohPhz9; Mon, 13 Jan 2025 10:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1736762415; bh=Gtj1kJssOeOq0eKw15LcYbG/E/aOYWJcRZtkWUlRzdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jLk3t6gxsZth7Dm2+qfLlJJz6oxerfDXus5b/J05lMz4HeoWzQSN3+X7YajD2AZcA
	 rv5xtl8NViYkDEmsteFlhf53Sh7Fm/wnm530iQad+t5l2fMBsM06VhzF68C3ND8PYI
	 FPTBF6tKE20ZMhXFZbyDMl7qIl5PIrrW2WFeTxmwObcQ6uNXLfQ1fbUsQloqtU7Jm2
	 VSS1gXhLLYPRvMzllowD4KFu15uMl3zEuc+htRsqf/STBHvtJ3LkRhKsaretY3WEb8
	 dXPftHm+NoJDSPck0eFNyn+X2j/2mYtdPOb7hNb1zOsRyX5UAPoPo0miwXlV/fCdMR
	 PvFEJn+DzXykSGWJtKee4DvS3sfLZst2SxlGe/JmGEjTl0M4xCdj32HLT3ZRHAGiwb
	 0cRiF8xDWp8fKapqy86nn/5g1FQ1O0Ye1xHxRMgm84m1BCJLWvcMfHz/T/L5xiDTCp
	 p+5YBeAaT8JjT20OS1E3FpSNQk+rxawYMYbQP32yMgOvqQ+Vj0vKByr9NqWM/OOqm5
	 /aCowUqUvYL5/gNuJtd9a7SfkKOzi/UUujKZJiNEVy9RGYbgR2S4aEQ2VDW8LqwFL6
	 hiH/8caJtm7lRIL+ahVInFPorAuSU/PSSt4Q/uEFFSHeJHb1IchQd1+fee49r2fkLo
	 T3VQwL519Rm6t3Vfa6fqmObY=
Received: from zn.tnic (pd953008e.dip0.t-ipconnect.de [217.83.0.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0095B40E01F9;
	Mon, 13 Jan 2025 10:00:04 +0000 (UTC)
Date: Mon, 13 Jan 2025 10:59:59 +0100
From: Borislav Petkov <bp@alien8.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux@treblig.org, mingo@redhat.com, tglx@linutronix.de,
	dave.hansen@linux.intel.com, hpa@zytor.com, x86@kernel.org,
	linux-rtc@vger.kernel.org, arnd@arndb.de,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: Remove hpet_rtc_dropped_irq()
Message-ID: <20250113095959.GAZ4TkH3SxUuRbB7X7@fat_crate.local>
References: <20241215022356.181625-1-linux@treblig.org>
 <20250112232600ca0c0fd4@mail.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250112232600ca0c0fd4@mail.local>

On Mon, Jan 13, 2025 at 12:26:00AM +0100, Alexandre Belloni wrote:
> Dear x86 maintainers,
> 
> On 15/12/2024 02:23:56+0000, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > hpet_rtc_dropped_irq() has been unused since
> > commit f52ef24be21a ("rtc/alpha: remove legacy rtc driver")
> > 
> > Remove it in rtc, and x86 hpet code.
> > 
> 
> I'm willing t take this patch, can I get an ack?

Acked-by: Borislav Petkov (AMD) <bp@alien8.de>

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

