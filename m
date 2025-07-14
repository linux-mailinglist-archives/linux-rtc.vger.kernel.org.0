Return-Path: <linux-rtc+bounces-4497-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A463FB03693
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Jul 2025 08:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16CD717432D
	for <lists+linux-rtc@lfdr.de>; Mon, 14 Jul 2025 06:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBFF7222562;
	Mon, 14 Jul 2025 06:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rotWQsb+"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFFE621FF44
	for <linux-rtc@vger.kernel.org>; Mon, 14 Jul 2025 06:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752473462; cv=none; b=tA9NOQx1cE1tGVTQfscCQT5s4Sy7ogBWkO0icD2LGrNaxj5CuqtHLdjd8srAFQrQbfOqVLzptsqndMIx/ydCqsk5N5BGz1DKckIz1H9fpp2uBDp3vOhekYbId9E68PfpHMWMXBZfZeY9Y3+t96PWZsrZLjVXaDHSYIT2nvPPldI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752473462; c=relaxed/simple;
	bh=e/rH8SD+Tg5pje3Lq+JRo3ekvTZcKBI1NyNIj2hZ318=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GNGow8EW14x6vLJakzyWI90yiB9RnaTOxk4jFl4JldpyKiYG88wyQH3U3zSuNlcGLd2U/W/HP9B8KdKTmZKnMRWLPTHoJNxhU1woW81bwnY8pGDyORYnHCfZ1UnAkfF7mYfwiO2IekBx4+YKZM57NOCtTrkIwUefc5KInZVN2JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rotWQsb+; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-455ea9cb0beso19064165e9.0
        for <linux-rtc@vger.kernel.org>; Sun, 13 Jul 2025 23:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752473458; x=1753078258; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dSes2g4E88oXBSFPDQ6neF7W89c9NwaUqwVhdR4xBqI=;
        b=rotWQsb+BzRaXaIF9EZasLzZPYnyLA4P5S1PT+5/VWN+Dhgdyo75t/Im2oc/puNMDM
         r4svFhAoVbTatc2Jeqfv8qnRYvFIWvGq20uJoCzlHiqN1B18XNUtilZ+1JTOEUzcsUsX
         upmsORqXRWevk6jm6eH4HGoM0UqqRwvU7Mc+JmeWBLssK4ATbh+xhplHXd9NbFHBlHjE
         StNxdm30CXJ+AI/WNkBSaezuJuaSieyu/t60RYUsKFFKdwC/6Q4oBlp9QVZZzVhHBL2H
         f/yC25oznPeMr/RKPnPDrWt0fMo95Wk5GN6CHASnkC5/kcCDzJRLK4YHCs3/i2ff/UcH
         qxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752473458; x=1753078258;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dSes2g4E88oXBSFPDQ6neF7W89c9NwaUqwVhdR4xBqI=;
        b=H7T/3ZuYrdR0BvmMkW6C1pyeu5CFuF0gPAkna7ZHQN7Advlf+cN125XM7Z1de6Q08J
         azJh5LmYfQuZqw1qV/B7/cizu6U4+IvgABJ4QhOFf+x0NJUz/rxnTapPfiWVXdlnnzVl
         LjISGLeSg8K+YQGrANFcDdpARvJyjSyEavw5Ny9wh5E8H5ZIb3y34ISNJbjv3oDCybFt
         hsgbz5yCpeybajs6cdsjtapRBy3Fppj9Q44BNuYQxNJhC8Y7Q8Lvqkd1dOaEE5StHf2N
         aGDV4v84UubOi/939ovvOXsqBJ8AlN3S4bGDw5iWKR7M1LKV2ZLdXWZS/CWwAZ/VBZ5J
         INbw==
X-Forwarded-Encrypted: i=1; AJvYcCW8sHrh54DegzqING+wbd9uqfZRj0zP417pqMtj/9xAFgw5zuS8RP2nVQtRBOTrK/STcqkdCOuPTd4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDLe2ncHzW9gJpmvfyNrFgH5E4UP/v3PUQQM7h1GMLVFgO+7H4
	P59n1zFmvgwL6Y8qeqVkW4qG6SdJj9QrDJKXltaeJOfVEmoUd8krDIJMHmiisng/Lw5GS4LZgA=
	=
X-Google-Smtp-Source: AGHT+IFULlVjyNemOnSbG4TdMozAA0zsJZsF8hZ5FwjjrDDzQ4zhxHet1bEj5zD9JLh9WJDb+7sgf2zL
X-Received: from wmbel18.prod.google.com ([2002:a05:600c:3e12:b0:456:1194:a7e7])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:358f:b0:456:7cf:527a
 with SMTP id 5b1f17b1804b1-45607cf57cbmr50279335e9.28.1752473458182; Sun, 13
 Jul 2025 23:10:58 -0700 (PDT)
Date: Mon, 14 Jul 2025 08:08:45 +0200
In-Reply-To: <20250714060843.4029171-5-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250714060843.4029171-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4119; i=ardb@kernel.org;
 h=from:subject; bh=1185/TpkpWg9isRLFf5wyjQebHCYqV40b1OjCDnfhjU=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIaNk3pfgGfFHvMs1rzs+7g2Z3jR3vmPyZLljMXN3nZu4o
 j/3A2d6RykLgxgXg6yYIovA7L/vdp6eKFXrPEsWZg4rE8gQBi5OAZhI9XmGf+YT5LnE2xivqL3c
 nC3HM8NQY4PQY8/mbbM+RMQ4nbzY8JqRYeV6Hz0bozMrpnLtY7c4Y8N90k7s2BaRs7se9l/3u/z 3DAMA
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250714060843.4029171-6-ardb+git@google.com>
Subject: [RFC PATCH 1/3] efi-rtc: Remove wakeup functionality
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

The EFI rtc driver is used by non-x86 architectures only, and exposes
the get/set wakeup time functionality provided by the underlying
platform. This is usually broken on most platforms, and not widely used
to begin with [if at all], so let's just remove it.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 drivers/rtc/rtc-efi.c | 76 +-------------------
 1 file changed, 2 insertions(+), 74 deletions(-)

diff --git a/drivers/rtc/rtc-efi.c b/drivers/rtc/rtc-efi.c
index fa8bf82df948..b4f44999ef0f 100644
--- a/drivers/rtc/rtc-efi.c
+++ b/drivers/rtc/rtc-efi.c
@@ -112,48 +112,6 @@ convert_from_efi_time(efi_time_t *eft, struct rtc_time *wtime)
 	return true;
 }
 
-static int efi_read_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
-{
-	efi_time_t eft;
-	efi_status_t status;
-
-	/*
-	 * As of EFI v1.10, this call always returns an unsupported status
-	 */
-	status = efi.get_wakeup_time((efi_bool_t *)&wkalrm->enabled,
-				     (efi_bool_t *)&wkalrm->pending, &eft);
-
-	if (status != EFI_SUCCESS)
-		return -EINVAL;
-
-	if (!convert_from_efi_time(&eft, &wkalrm->time))
-		return -EIO;
-
-	return rtc_valid_tm(&wkalrm->time);
-}
-
-static int efi_set_alarm(struct device *dev, struct rtc_wkalrm *wkalrm)
-{
-	efi_time_t eft;
-	efi_status_t status;
-
-	convert_to_efi_time(&wkalrm->time, &eft);
-
-	/*
-	 * XXX Fixme:
-	 * As of EFI 0.92 with the firmware I have on my
-	 * machine this call does not seem to work quite
-	 * right
-	 *
-	 * As of v1.10, this call always returns an unsupported status
-	 */
-	status = efi.set_wakeup_time((efi_bool_t)wkalrm->enabled, &eft);
-
-	dev_warn(dev, "write status is %d\n", (int)status);
-
-	return status == EFI_SUCCESS ? 0 : -EINVAL;
-}
-
 static int efi_read_time(struct device *dev, struct rtc_time *tm)
 {
 	efi_status_t status;
@@ -188,17 +146,13 @@ static int efi_set_time(struct device *dev, struct rtc_time *tm)
 
 static int efi_procfs(struct device *dev, struct seq_file *seq)
 {
-	efi_time_t        eft, alm;
+	efi_time_t        eft;
 	efi_time_cap_t    cap;
-	efi_bool_t        enabled, pending;
-	struct rtc_device *rtc = dev_get_drvdata(dev);
 
 	memset(&eft, 0, sizeof(eft));
-	memset(&alm, 0, sizeof(alm));
 	memset(&cap, 0, sizeof(cap));
 
 	efi.get_time(&eft, &cap);
-	efi.get_wakeup_time(&enabled, &pending, &alm);
 
 	seq_printf(seq,
 		   "Time\t\t: %u:%u:%u.%09u\n"
@@ -214,26 +168,6 @@ static int efi_procfs(struct device *dev, struct seq_file *seq)
 		/* XXX fixme: convert to string? */
 		seq_printf(seq, "Timezone\t: %u\n", eft.timezone);
 
-	if (test_bit(RTC_FEATURE_ALARM, rtc->features)) {
-		seq_printf(seq,
-			   "Alarm Time\t: %u:%u:%u.%09u\n"
-			   "Alarm Date\t: %u-%u-%u\n"
-			   "Alarm Daylight\t: %u\n"
-			   "Enabled\t\t: %s\n"
-			   "Pending\t\t: %s\n",
-			   alm.hour, alm.minute, alm.second, alm.nanosecond,
-			   alm.year, alm.month, alm.day,
-			   alm.daylight,
-			   enabled == 1 ? "yes" : "no",
-			   pending == 1 ? "yes" : "no");
-
-		if (alm.timezone == EFI_UNSPECIFIED_TIMEZONE)
-			seq_puts(seq, "Timezone\t: unspecified\n");
-		else
-			/* XXX fixme: convert to string? */
-			seq_printf(seq, "Timezone\t: %u\n", alm.timezone);
-	}
-
 	/*
 	 * now prints the capabilities
 	 */
@@ -249,8 +183,6 @@ static int efi_procfs(struct device *dev, struct seq_file *seq)
 static const struct rtc_class_ops efi_rtc_ops = {
 	.read_time	= efi_read_time,
 	.set_time	= efi_set_time,
-	.read_alarm	= efi_read_alarm,
-	.set_alarm	= efi_set_alarm,
 	.proc		= efi_procfs,
 };
 
@@ -271,11 +203,7 @@ static int __init efi_rtc_probe(struct platform_device *dev)
 	platform_set_drvdata(dev, rtc);
 
 	rtc->ops = &efi_rtc_ops;
-	clear_bit(RTC_FEATURE_UPDATE_INTERRUPT, rtc->features);
-	if (efi_rt_services_supported(EFI_RT_SUPPORTED_WAKEUP_SERVICES))
-		set_bit(RTC_FEATURE_ALARM_WAKEUP_ONLY, rtc->features);
-	else
-		clear_bit(RTC_FEATURE_ALARM, rtc->features);
+	clear_bit(RTC_FEATURE_ALARM, rtc->features);
 
 	device_init_wakeup(&dev->dev, true);
 
-- 
2.50.0.727.gbf7dc18ff4-goog


