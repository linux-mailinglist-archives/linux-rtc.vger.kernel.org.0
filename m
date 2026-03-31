Return-Path: <linux-rtc+bounces-6270-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PTSCJwjzGllQQYAu9opvQ
	(envelope-from <linux-rtc+bounces-6270-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Mar 2026 21:42:20 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F49370B27
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Mar 2026 21:42:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 66071308DFD0
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Mar 2026 19:39:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9EE3E317F;
	Tue, 31 Mar 2026 19:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LeSyZKUn"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777AD38BF70;
	Tue, 31 Mar 2026 19:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985952; cv=none; b=O8hc7VwJ7bFVvlOYB2D81XDSTCeg9DjkqWLUIcNuRymaRTBQUm9zB/FNZ57mTTuGdcoEBZVwvzRgkVcuksnZMohyteuiG53e/iCwl88kseJxdmCcMi7AG3OFvm09YRPmQ6NpMTLBcyvQxiaQNuIQ/n28Oxd4oo4KhZM/5nTVIHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985952; c=relaxed/simple;
	bh=ROXGloYFr3Em6drAl3lAWq56qc4avfRlK++WvhLuLNE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hsRpJuX9tnBPdEYtl+1BZQM+tmFV03pN73H7cPCR/7hbfatdkBCzdhPd1VB++cQUWNOfVVUxJBVbUayzwvu/6/M+sBNTAButx+HlPpfwREPF1V1qmUc/1EVAQsb/noGPEie6tZtFbLNd0WWwAM4e9jcJcoekh+PQezb6kVwhV6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LeSyZKUn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D52C2BCB3;
	Tue, 31 Mar 2026 19:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774985952;
	bh=ROXGloYFr3Em6drAl3lAWq56qc4avfRlK++WvhLuLNE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LeSyZKUnkfa0YlwQ1fbY9huR5LAnUJkqnRJNM6gTvY2Q/uV/XC+Xp7Sa3P8lDPcnS
	 s4XicVAkbjnow97qttaSvlT/NORZX8VNSEQuIg7Wv+lxX+ddAK2r/6UaNqPh2Dl8jn
	 q3ikfvffJREgYkJUwP+d3xbGdGhMN+PUv6sk6eIKTFml1BGEAG7P+cP1OB7UQXRQBJ
	 S3daOm7X9ytc28/Ktx1/0eK0sXO2SGWkLhMhJQ0iK6WAjbzqOdAG5M24+/x0hhyKmt
	 rLtkc3GrENLcHR8nabjzSOmfTnBV6OoDSxc4Go8RTmTqFvXUS+M448LfM/W1yStBBI
	 zMvFcyEybjAIA==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Linux ACPI <linux-acpi@vger.kernel.org>
Cc: linux-rtc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v1 3/4] ACPI: TAD: Split acpi_tad_rtc_set_time()
Date: Tue, 31 Mar 2026 21:26:23 +0200
Message-ID: <9619488.CDJkKcVGEf@rafael.j.wysocki>
Organization: Linux Kernel Development
In-Reply-To: <2366642.iZASKD2KPV@rafael.j.wysocki>
References: <2366642.iZASKD2KPV@rafael.j.wysocki>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6270-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,rafael.j.wysocki:mid]
X-Rspamd-Queue-Id: A8F49370B27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Move the code converting a struct acpi_tad_rt into a struct rtc_time
from acpi_tad_rtc_set_time() into a new function, acpi_tad_rt_to_tm(),
to facilitate adding alarm support to the driver's RTC class device
interface going forward.

No intentional functional impact.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/acpi_tad.c |   19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

--- a/drivers/acpi/acpi_tad.c
+++ b/drivers/acpi/acpi_tad.c
@@ -617,6 +617,17 @@ static const struct attribute_group *acp
 #ifdef CONFIG_RTC_CLASS
 /* RTC class device interface */
 
+static void acpi_tad_rt_to_tm(struct acpi_tad_rt *rt, struct rtc_time *tm)
+{
+	tm->tm_year = rt->year - 1900;
+	tm->tm_mon = rt->month - 1;
+	tm->tm_mday = rt->day;
+	tm->tm_hour = rt->hour;
+	tm->tm_min = rt->minute;
+	tm->tm_sec = rt->second;
+	tm->tm_isdst = rt->daylight == ACPI_TAD_TIME_ISDST;
+}
+
 static int acpi_tad_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct acpi_tad_rt rt;
@@ -642,13 +653,7 @@ static int acpi_tad_rtc_read_time(struct
 	if (ret)
 		return ret;
 
-	tm->tm_year = rt.year - 1900;
-	tm->tm_mon = rt.month - 1;
-	tm->tm_mday = rt.day;
-	tm->tm_hour = rt.hour;
-	tm->tm_min = rt.minute;
-	tm->tm_sec = rt.second;
-	tm->tm_isdst = rt.daylight == ACPI_TAD_TIME_ISDST;
+	acpi_tad_rt_to_tm(&rt, tm);
 
 	return 0;
 }




