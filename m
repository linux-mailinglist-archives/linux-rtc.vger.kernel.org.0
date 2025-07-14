Return-Path: <linux-rtc+bounces-4496-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E620EB03691
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Jul 2025 08:11:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 153AE189923D
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Jul 2025 06:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B77D21ABC9;
	Mon, 14 Jul 2025 06:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eNtZT1UZ"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 742B0212B0A
	for <linux-rtc@vger.kernel.org>; Mon, 14 Jul 2025 06:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752473459; cv=none; b=MmlIGDmZun2RuN/JT+qnx502T0vM7FsPEoEfhWojnpfzwedkYZnSho5X6uFwHEUMJu2iJGmIW/TUGY996K6ZMhXqt1+lhnvy2DDU3qznacXfwnmSQ0ZUtemwgd5SMQyZPdElA+1CqpmQm2yTqSHmyp+sWeqNEd+/RYe3Ea7qW2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752473459; c=relaxed/simple;
	bh=r3qINUs4GQGQK0KeSYb9XwtihHPTH4GAfxB3icQZeXg=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=LVHZI7KD0luzSC/Itj4UAW6q/dinvVnEXBTZo+fGlIksvtkPTn3YZhO1qNXX7z5cfQhYqnWUU0p1LFv0mS1VXojsxRwX7BrzNcmSl/CGVwv3TrROixO6zzKxb6Y+DJHfar3hRG82UPnTcdBNLlx5bELIFgqFgifFPlDrG14o2n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eNtZT1UZ; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6097b1faec9so3125965a12.3
        for <linux-rtc@vger.kernel.org>; Sun, 13 Jul 2025 23:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752473455; x=1753078255; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G9Tn70FKTpBDzek73ufnJv469R3NOa6ous5bCCu5m1U=;
        b=eNtZT1UZ0eiZxwKJ8uZzWGaSrR0nesz10REqhmGhVD5wNc+S8L1ekleKDIjcrnQBHA
         EY30DbjQVoxVN/CjBXSTksDPZTR6ii1UU1IuvTARMPhjOBGH+VhABB1jN7aDGpDE9X+c
         L8oz8yY7hmo0fZDNTcgJm5IhDEzR89BlNGzSJp9gau3MxWhQsMcTbAqTacHmwEyzN1X1
         2FhXL02y+9thkEAxMi5egp29Vpvdp83R1A5DNsX+8/MgwoNVBtR2GH+Yj53AyNMzw0Ur
         tllDgmjl9EusdA9/Hgd1nINcruUR78y4O2LzV9d7cgmJC6nzjWYv1tNrgV6EYOf5+WXt
         eUMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752473455; x=1753078255;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G9Tn70FKTpBDzek73ufnJv469R3NOa6ous5bCCu5m1U=;
        b=KGUNcv0/ITgfzPYGp9jPwbD4d1tER6AvrKo/beVv0BZVxIGZIHGoxgAymHXclkBMJR
         nhZQ1dOHPzU7CZQN5JQEf3pwU9W1GSVI9j2AQWeEdG8T3uhiaLYFOAnrAGxjqFlRWvW0
         ptybEtVkWpFxZANZ+19AN9Yg5dhpzaSbCLd6+tnWgSuVsYzko/p0f6rUq6Jvm4xXP28w
         dCR0VtA0GT+NX3tHgno98Xjkw44f9Zm7Z4PeMBRAIcZOagQap6rw7vZozVGrAT1AtQBS
         RnX/rkTWQ8Mz1H1qiLnz0Qht6CYv2qvvPOjd/65LaYqs/kPp6XWENKbiABo6xuEebVm2
         35PA==
X-Forwarded-Encrypted: i=1; AJvYcCWNFg0rW90NY2KQBBVYG06BHpHflgZWtTdVPMqs1lt7TgEKHblMaQGZGIJBRTNyncdt7WtAMhTtxMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSHj1EX+CMxqefygun6WMWxpxE4eR3hbAHH28MvO/gPTXlyheB
	fYopOuzutv9wUVu5xNIJCBAsnWYF2CVxSBTPcFiLlpraymjAkbt+kjAEcw+Amzwy2jU28XTm8w=
	=
X-Google-Smtp-Source: AGHT+IHnMYU1tdLUgCWCMkDHtV2ofJo8Kj1jhtO5SeCzNxOoPrZb9dQJqddWyqsdiNjGgTivJJ6PBrvn
X-Received: from edbec48.prod.google.com ([2002:a05:6402:d70:b0:612:b2a:492f])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:2551:b0:60c:6c85:48dd
 with SMTP id 4fb4d7f45d1cf-611e84d5ce0mr9692143a12.23.1752473454949; Sun, 13
 Jul 2025 23:10:54 -0700 (PDT)
Date: Mon, 14 Jul 2025 08:08:44 +0200
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2042; i=ardb@kernel.org;
 h=from:subject; bh=lBZw99MDLRGQYnmUAEaW8S2w5GuCP7F3IekTWgHFi6g=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIaNk3vvT+9Y9uuM3TXFJnJtsxIyzqcz/eR/PsPqzeEKNP
 R/foYsSHaUsDGJcDLJiiiwCs/++23l6olSt8yxZmDmsTCBDGLg4BWAiJ5gZGS5KK9wuT5s0Q+Ja
 CftM/4wbF554nvlzf3ftBpG1fNZ/k0QY/nDa+K/0XKev99bz53mu6oadcpenx9Ud4TpWE21YcXy aJQ8A
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714060843.4029171-5-ardb+git@google.com>
Subject: [RFC PATCH 0/3] Remove unused EFI runtime APIs
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Feng Tang <feng.tang@linux.alibaba.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Juergen Gross <jgross@suse.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Bibo Mao <maobibo@loongson.cn>, linux-rtc@vger.kernel.org, linux-efi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, x86@kernel.org, 
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Using EFI runtime services to program the RTC to wake up the system is
supported in theory, but rarely works in practice. Fortunately, this
functionality is rarely [if ever] used to begin with so we can just drop
it. (Note that the EFI rtc driver is not used by x86, which programs the
CMOS rtc directly)

The same applies to GetNextHighMonoCount(), which, if implemented,
usually relies on SetVariable() under the hood *, which is often not
supported at runtime by non-x86 platforms. But it has no known users
either so let's drop support for it as well.

This means we need to drop the slightly pointless tests for it too.

* EDK2 based EFI implementations usually have a MTC variable carrying
  the monotonic counter variable, which is therefore not truly
  monotonic, given that SetVariable() will happily overwrite it. 

Cc: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Cc: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com> 
Cc: Sunil V L <sunilvl@ventanamicro.com>
Cc: Bibo Mao <maobibo@loongson.cn>
Cc: linux-rtc@vger.kernel.org
Cc: linux-efi@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
Cc: x86@kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: loongarch@lists.linux.dev

Ard Biesheuvel (3):
  efi-rtc: Remove wakeup functionality
  efi/test: Don't bother pseudo-testing unused EFI services
  efi: Remove support for pointless, unused EFI services

 arch/x86/platform/efi/efi_64.c          |  22 ----
 drivers/firmware/efi/runtime-wrappers.c |  68 ------------
 drivers/firmware/efi/test/efi_test.c    | 108 +-------------------
 drivers/rtc/rtc-efi.c                   |  76 +-------------
 drivers/xen/efi.c                       |  56 ----------
 include/linux/efi.h                     |   6 --
 6 files changed, 4 insertions(+), 332 deletions(-)

-- 
2.50.0.727.gbf7dc18ff4-goog


