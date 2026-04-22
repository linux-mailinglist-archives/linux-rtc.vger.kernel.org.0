Return-Path: <linux-rtc+bounces-6392-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8KMaOCjq6Gl4RgIAu9opvQ
	(envelope-from <linux-rtc+bounces-6392-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Apr 2026 17:32:56 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A328447F39
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Apr 2026 17:32:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0B00F3105D5A
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Apr 2026 15:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BBCC3469E6;
	Wed, 22 Apr 2026 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fUeuHMAw"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CF832861F;
	Wed, 22 Apr 2026 15:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776871678; cv=none; b=YLTd7JqZ01N735TTFsf454u59ug59U9Xq324HVun7IZMo4bGyfBQJJGibG1nPWZ7dCaDoKCVNreyp2h5Mi5mbXXPUSfTvn70cXU+Wx6rr08d9KWEXrKZbvNRaetdRf9JE2f1AliRUxH4JcQDuwA4IWqFg+pgG4n5HWiWn/tBULw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776871678; c=relaxed/simple;
	bh=SdhQbESNFDH1bXcdLQC9jBBaB9HVX2mb7A0M6v65Zac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LnUiWoU2Lo/rpmcw3tIfEKKUuftEUt+j5di1gn2UA4SkJrePm/EOu1hS1VP5hSNDSAg1Q3FRbdegD8rYDH9dBiK8zS2usDP1DSuMGZzgoPpVpBHTqUEYuOvioH5PQ/JHt9Ii2yuXGQkGdE+gMbQwQSoTtePRkA/Kh+3tXfLURgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fUeuHMAw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F3EC19425;
	Wed, 22 Apr 2026 15:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776871678;
	bh=SdhQbESNFDH1bXcdLQC9jBBaB9HVX2mb7A0M6v65Zac=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fUeuHMAwGFWxQzn7hChqoj5FxnmYgwICxcAVpRaKMgRBPbxdKbWjdNgZDJDkrTWJl
	 69hQvzBEy5J7rGipctEyus+rGgw4i7acmoRYB0oVB//DblgiOsI3h2h5IhNT+dkDm5
	 xeFNGBrdcJClie9W7y5pw0esuuyQ/1QLUBox+ZXIWxzY3z3EYOmXYJIJhISZH09f5W
	 Bdn60CLX7bJtLgqVENp3ika0+MteK3ZuECXqAuG46gFmzJSoO9Cdt1p+TYpN143LqW
	 dvW9xuEx0gj5ghEnUzY2nlBIkRVT4mKFEE0aU/GFxIg3AGaH0sawIGGPYS3tDgD9/X
	 gMUN72HFtl3UA==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Linux ACPI <linux-acpi@vger.kernel.org>
Cc: linux-rtc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject:
 [PATCH v1 3/4] ACPI: TAD: RTC: Refine timer value computations and checks
Date: Wed, 22 Apr 2026 17:26:49 +0200
Message-ID: <3414608.aeNJFYEL58@rafael.j.wysocki>
Organization: Linux Kernel Development
In-Reply-To: <2415066.ElGaqSPkdT@rafael.j.wysocki>
References: <2415066.ElGaqSPkdT@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	CTE_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6392-lists,linux-rtc=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[rafael.j.wysocki:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,intel.com:email]
X-Rspamd-Queue-Id: 5A328447F39
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Since rtc_tm_to_ktime() may overflow for large RTC time values and
full second granularity is sufficient in timer value computations
in acpi_tad_rtc_set_alarm() and acpi_tad_rtc_read_alarm(), use
rtc_tm_to_time64() instead of that function, which also allows the
computations to be simplified.

Moreover, U32_MAX is a special "timer disabled" value, so make
acpi_tad_rtc_set_alarm() reject it when attempting to program the
alarm timers.

Fixes: 7572dcabe38d ("ACPI: TAD: Add alarm support to the RTC class device interface")
Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/acpi_tad.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

--- a/drivers/acpi/acpi_tad.c
+++ b/drivers/acpi/acpi_tad.c
@@ -680,9 +680,8 @@ static int acpi_tad_rtc_set_alarm(struct
 
 		acpi_tad_rt_to_tm(&rt, &tm_now);
 
-		value = ktime_divns(ktime_sub(rtc_tm_to_ktime(t->time),
-					      rtc_tm_to_ktime(tm_now)), NSEC_PER_SEC);
-		if (value <= 0 || value > U32_MAX)
+		value = rtc_tm_to_time64(&t->time) - rtc_tm_to_time64(&tm_now);
+		if (value <= 0 || value >= U32_MAX)
 			return -EINVAL;
 	}
 
@@ -745,8 +744,7 @@ static int acpi_tad_rtc_read_alarm(struc
 
 	if (retval != ACPI_TAD_WAKE_DISABLED) {
 		t->enabled = 1;
-		t->time = rtc_ktime_to_tm(ktime_add_ns(rtc_tm_to_ktime(tm_now),
-						       (u64)retval * NSEC_PER_SEC));
+		rtc_time64_to_tm(rtc_tm_to_time64(&tm_now) + retval, &t->time);
 	} else {
 		t->enabled = 0;
 		t->time = tm_now;




