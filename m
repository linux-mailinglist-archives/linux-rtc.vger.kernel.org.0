Return-Path: <linux-rtc+bounces-6202-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHF/G91QtWm8zAAAu9opvQ
	(envelope-from <linux-rtc+bounces-6202-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Mar 2026 13:13:17 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9FB28D0F8
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Mar 2026 13:13:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D6CC30142B2
	for <lists+linux-rtc@lfdr.de>; Sat, 14 Mar 2026 12:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8966231ED83;
	Sat, 14 Mar 2026 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NR01Byvi"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6614C17BA2;
	Sat, 14 Mar 2026 12:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773490380; cv=none; b=WlGhTXeGQ/xfdv5aboLBi7pyYs8+skptj3S2dm28pwcHonRD14+be56O9Vb0wkMRMf90xdAKrNWgs2DD7/x+owXjCytzNHj8VhKrzmT8Lr/iHsv71IR+HGuQkBWJCHg74tjIVpwWh+hSxxiJUrlq8nL/AXX+lrKuW8ZUgFrO4LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773490380; c=relaxed/simple;
	bh=s+9pzKZUNJo/fFOmmNEGV6HBpqHsc/pBMHJQwvs2TRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eVll7urPNmZO8gKzN1FUoaJr+HWUfH8zOh0/d6lmZCR9zRcKRpd939xRK1RB+y2VDoNnqaBbzBXYPjaHwJdf2Orxr7qAWwvW05ihLD6pAwfOHleQXUmu57r2ecsJQXtsr0Weznj1sOqhoVb09Nt7+wj+hlDMIaVLhna6Idml4I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NR01Byvi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16B5EC116C6;
	Sat, 14 Mar 2026 12:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773490380;
	bh=s+9pzKZUNJo/fFOmmNEGV6HBpqHsc/pBMHJQwvs2TRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NR01Byvir5A8/r8HnWge3+QVOfU9c58Z1joVngYWQElFESmhUHWGpa39w/emCEooc
	 4qWg1x6pRIn8OEhDbt3amP5didv7jJZ1LVMjKj1XE+HyMIwCyaKGPdtDxY6mQXNziY
	 JSeR/bPd+Q6RoTVZqUtNdNzljDpm5JmnEt+2DU4ZIKVMAsVUP0nfVq1TQDyKG5DdBj
	 LH/aMFSaLcVlzGfrm2YwVp9p9oyQO2wPbLlp676aSB3BXKbsts2DDHpRBkx0461/S7
	 DkvtXlopH76g8MaH8lO4eUDd4EvxmT3YGaD2bzVtsu/xBekklyR+ulkpoxnKSzcGSE
	 G8LC5FPSJ72mQ==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: linux-rtc@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject:
 [PATCH v1 1/2] rtc: cmos: Enable ACPI alarm if advertised in ACPI FADT
Date: Sat, 14 Mar 2026 13:11:20 +0100
Message-ID: <9618535.CDJkKcVGEf@rafael.j.wysocki>
Organization: Linux Kernel Development
In-Reply-To: <3964452.kQq0lBPeGt@rafael.j.wysocki>
References: <3964452.kQq0lBPeGt@rafael.j.wysocki>
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
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	CTE_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6202-lists,linux-rtc=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rafael@kernel.org,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-rtc];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,rafael.j.wysocki:mid]
X-Rspamd-Queue-Id: 7E9FB28D0F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

If the ACPI_FADT_FIXED_RTC flag is unset, the platform is declaring that
it supports the ACPI RTC fixed event which should be used instead of a
dedicated CMOS RTC IRQ.  However, the driver only enables it when
is_hpet_enabled() returns true, which is questionable because there is
no clear connection between enabled HPET and signaling wakeup via the
ACPI RTC fixed event (for instance, the latter can be expected to work
on systems that don't include a functional HPET).

Moreover, since use_hpet_alarm() returns false if use_acpi_alarm is set,
the ACPI RTC fixed event is effectively used instead of the HPET alarm
if the latter is functional, but there is no particular reason why it
could not be used otherwise.

Accordingly, on x86 systems with ACPI, set use_acpi_alarm if
ACPI_FADT_FIXED_RTC is unset without looking at whether or not HPET is
enabled.

Also, do the ACPI FADT check in use_acpi_alarm_quirks() before the DMI
BIOS year checks which are more expensive and it's better to skip them
if ACPI_FADT_FIXED_RTC is set.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/rtc/rtc-cmos.c |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

--- a/drivers/rtc/rtc-cmos.c
+++ b/drivers/rtc/rtc-cmos.c
@@ -817,6 +817,9 @@ static void rtc_wake_off(struct device *
 #ifdef CONFIG_X86
 static void use_acpi_alarm_quirks(void)
 {
+	if (acpi_gbl_FADT.flags & ACPI_FADT_FIXED_RTC)
+		return;
+
 	switch (boot_cpu_data.x86_vendor) {
 	case X86_VENDOR_INTEL:
 		if (dmi_get_bios_year() < 2015)
@@ -830,8 +833,6 @@ static void use_acpi_alarm_quirks(void)
 	default:
 		return;
 	}
-	if (!is_hpet_enabled())
-		return;
 
 	use_acpi_alarm = true;
 }




