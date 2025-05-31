Return-Path: <linux-rtc+bounces-4208-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFEFAC9C79
	for <lists+linux-rtc@lfdr.de>; Sat, 31 May 2025 21:16:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 562189E261E
	for <lists+linux-rtc@lfdr.de>; Sat, 31 May 2025 19:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EE7264A8F;
	Sat, 31 May 2025 19:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5PpyCzh"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DC21A288;
	Sat, 31 May 2025 19:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748718987; cv=none; b=X9h4UMa4Lz5rNEVLzVBTX8MxVJVJtcdYl7fPzAWF3Bfo2GOZAt0hDNXtzy6ZdjDkzitwgC1/gsi1r4E+PsPXX5tOP9uDOe9Hu3wZXffyTdUv9EenBs0JK5xI/SCBYyN8YEJaRey8T56VujSwSvGlzq7yxcg/DWqJ8JvDkfjNaQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748718987; c=relaxed/simple;
	bh=9z5f32YIThyjeERpUHPDhcWPSC16ORf2Hbk+NhjEWKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iw4CGlMHv3o0sMosza7m+7bVmKRgKiZ3wkVADxjcNpIJF1NQ4InkCYyUWmOtMlqpKU1Cl7Ps0BNFyfWrGDXTD6tKyko3yLNTnDEtFyBl/5/pM4AkoEP76fOyUDcCdsjaFXbe6TQPofVVSnjt9v/XS31KNyTbotUMqMUYv7b2vFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m5PpyCzh; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so1089290f8f.0;
        Sat, 31 May 2025 12:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748718984; x=1749323784; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ba8Ewaax3skZGpn2w/AasFrW04rf1D6XoW4B0rxSXrM=;
        b=m5PpyCzhZNOANKExZeXoesLzv30SxfXBNvyIH6efZv703QOAMJ3RGUjE6qp3LDSgUM
         B4kiR9xUPiMcVrC5v/S9YKwnV9APchX+Djdx+a21SHqQlWWArp5ScMLuFDpF2uNccxus
         QjibrQZ7P7pibrLZmkxcMnU+wVDU3h6bqTm1R/tNkXOhc1IzGKPw/75Xjtd7kQGeHy6/
         3e5/vtDc0PJu+rqlwUWm86LWbL5Q76CRs4aE1nmRXaRinHNkvoXI2VcVJhw+CjSnfTLj
         wvC7NvvosqpZs4hoQ+Hudc4oCouG3B3WSSs2s7V43Uz7DPVI7KSj6xxMsboYst4vWAss
         T/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748718984; x=1749323784;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ba8Ewaax3skZGpn2w/AasFrW04rf1D6XoW4B0rxSXrM=;
        b=Rk8PrC1Q/1c/XeHhBDMMh5HjWvzDr8TXaBdF3KU6HJSbnvxrwx7iEYXxKBQCEUwg4d
         MtagDBZkbiAGH5Ur4L2U4fKnZ9cdFIHaRr9P5k80AfDsSumu6lsHGLVECtbmbk57frRY
         KnB1HuRrQH2Rbm7XyvUbHSPD+nBS7WD3+SkDOp8NvuwTSLiYfttINAPSPVgAbpzRq/kt
         odb7GVaMrB+cV8E0m13tckuT4c0Fy6vYSS0tmTIomuvnF51lWGn4eQc5wscSuMjx2dyy
         amIVrvOBz57kFrdT1g/6LrtZrrHz4T/sY01UAICcN7jsyDbAXPnOtt7ZLURZd5dRWsgK
         mBMw==
X-Forwarded-Encrypted: i=1; AJvYcCVKBcxT4191gePfMHUK84Mbf7MvyIUWVBc4c77um1HwPHNskVPE9rtmGqQlDgLpgLArRKynYhEvL4UrHHM=@vger.kernel.org, AJvYcCW/PwGupWAPhtA+O1wdtSYVt+sSZ/HehudOoOu6Vke6lPJ7xFY/QCW8QSqvgmdNYaKeb9eI3cSmuSBg@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0ehvzR0BwjqAKgwGWVPFJCnkwkO32TZzhpqoWyENlHlpkkumK
	0d4RlUReEo3oPtYay98wV93YNu6BZpem2+Dsj4/8mzTLZt9yULE3Oxf1
X-Gm-Gg: ASbGncsdsAHbja1Na9aNAvDo/r5fdP9w0vjyzvqSZT1tqTIZfOgmjc/2JBhqo7wk9yr
	+HbXgFtBRKEEo+hQznbAM+BEePp/HIm6HJYYdXQzMFaB+DZ/KFNhQ6+jQ4QqHUNoZiF+EINY6n/
	p72/uIRjewZI0GexHFSelYlzhAHF1DR7FTKSC4MX17EfBn+TppvDAoph2NW4w/+jxOjsDYLkuHJ
	VRIcFHUbjaKYdvD4IPl39y0scGISEAP2+BogxkrFsqf+F4TcKcn4+LWAd3H3DOI2FN//r3xs4Zd
	1HDfzPPBKOwJWzrFDWQPx4nb6cUOFhaslkiZtz0s8ngi/TGjpMqwHtyU7K5tP6JwnC6xWVWAt30
	=
X-Google-Smtp-Source: AGHT+IGaDqOsLAEEskaF2msEBC2HTgDRmrS8aWEIGjvPriuNLUkbzs9Pp0q/ZA+X4ZybR45ggCs+AQ==
X-Received: by 2002:a05:6000:2082:b0:3a3:7987:945f with SMTP id ffacd0b85a97d-3a4f89e24e4mr5529224f8f.57.1748718983546;
        Sat, 31 May 2025 12:16:23 -0700 (PDT)
Received: from debian.local ([2a0a:ef40:eaf:3101:2d68:caee:7294:3fe1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44fcd135f6bsm103309015e9.3.2025.05.31.12.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 May 2025 12:16:22 -0700 (PDT)
Date: Sat, 31 May 2025 20:16:20 +0100
From: Chris Bainbridge <chris.bainbridge@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
	linux-rtc@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Mateusz =?utf-8?Q?Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
	lkml <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH] timekeeping: Add a lockdep override in tick_freeze().
Message-ID: <aDtVhPJD43DKNG3A@debian.local>
References: <20250330113202.GAZ-krsjAnurOlTcp-@fat_crate.local>
 <87sempv17b.ffs@tglx>
 <20250403135031.giGKVTEO@linutronix.de>
 <20250403193659.hhUTgJLH@linutronix.de>
 <87r029uh3j.ffs@tglx>
 <20250404133429.pnAzf-eF@linutronix.de>
 <aDtJ92foPUYmGheF@debian.local>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aDtJ92foPUYmGheF@debian.local>

On Sat, May 31, 2025 at 07:27:03PM +0100, Chris Bainbridge wrote:
> Hi,
> 
> I'm getting "WARNING: inconsistent lock state" on resume with this
> commit (92e250c624ea37fde64bfd624fd2556f0d846f18):
> 

Further testing shows there are some required conditions for this
warning to be shown. The suspend must be of a short enough duration that
it does "not reach hardware sleep state" (according to amd_s2idle.py).

Also the warning is only shown once, I don't know if this is because the
conditions for the warning only occur once, or if there is log limit
somewhere that prevents it from being logged more than once.

I can reliably reproduce the warning by running amd_s2idle.py and
waiting for the automatic resume:

# ./amd_s2idle.py --log log --duration 5 --wait 4 --count 1
Debugging script for s2idle on AMD systems
💻 HP HP Pavilion Aero Laptop 13-be0xxx (103C_5335KV HP Pavilion) running BIOS 15.17 (F.17) released 12/18/2024 and EC 79.31
🐧 Debian GNU/Linux trixie/sid
🐧 Kernel 6.15.0-rc1-00002-g92e250c624ea
🔋 Battery BAT0 (313-27-3C-A PC03043XL) is operating at 100.00% of design
Checking prerequisites for s2idle
✅ Logs are provided via systemd
✅ AMD Ryzen 7 5800U with Radeon Graphics (family 19 model 50)
✅ SMT enabled
✅ LPS0 _DSM enabled
✅ ACPI FADT supports Low-power S0 idle
✅ HSMP driver `amd_hsmp` not detected (blocked: False)
✅ PMC driver `amd_pmc` loaded (Program 0 Firmware 64.73.0)
✅ GPU driver `amdgpu` bound to 0000:03:00.0
✅ System is configured for s2idle
✅ NVME Intel Corporation SSD 670p Series [Keystone Harbor] is configured for s2idle in BIOS
✅ GPIO driver `pinctrl_amd` available
🚦 Device firmware checks unavailable without fwupd gobject introspection
Started at 2025-05-31 19:46:33.911590 (cycle finish expected @ 2025-05-31 19:46:42.911616)
Results from last s2idle cycle
○ Suspend count: 1
○ Hardware sleep cycle count: 1
○ Wakeup triggered from IRQ 9: ACPI SCI
○ Woke up from IRQ 9: ACPI SCI
○ gpe03 increased from 140 to 148
✅ Userspace suspended for 0:00:08.256333
❌ Did not reach hardware sleep state

If the duration arg is 6 or higher, then amd_s2idle.py reports that the
hardware sleep state was entered, and the "inconsistent lock state"
warning does not appear. If the duration is too low (e.g. 1 second),
then the laptop does not wake up automatically, and upon pressing a
keyboard key, the amdgpu driver will report an error resuming the GPU,
and the GPU will not be working. (I don't think the amdgpu problem is
related to the lock state warning, I'm just mentioning it for
completeness). It is the state between these two cases, where the laptop
does suspend and resume correctly, but the suspend is too short to enter
a hardware sleep state, where the problem occurs.

