Return-Path: <linux-rtc+bounces-6271-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sHZyBwQjzGnHPgYAu9opvQ
	(envelope-from <linux-rtc+bounces-6271-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Mar 2026 21:39:48 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6D7370A74
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Mar 2026 21:39:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 944BB30152CE
	for <lists+linux-rtc@lfdr.de>; Tue, 31 Mar 2026 19:39:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220943F9F35;
	Tue, 31 Mar 2026 19:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e61LLEgY"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C033DA5B9;
	Tue, 31 Mar 2026 19:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774985956; cv=none; b=mmMnawwt1eCUiA04L8C73rfmaoL6Gq8QrMF0vj0SYQHhnQx5vvWIbNtHzPMbaRdVGpafQk5VOSOT93aTgGMBIYlVSXO2eDX6p73EawzuhVBQupLlnHGrD3ySwf8Jp4AG84YVfJN58R2g5Fc32BbRhQD20fchrOXYcjxKzXpMJaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774985956; c=relaxed/simple;
	bh=LdWC8xo+CPAGwLW7PW8lF3NLcrWHS3lZUnNpHwOj4pU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G8B+2x/gAG57H1nHDK4sBY5TbnYXp4Yy354FI/4pyzwPjbGS7+MdKmQ/Pm7jivfZKDoNXjMSfm+5G5OoDRSBZob2dd62ZaJbferYlXbB9p9lAzcsBDZfd4NNLEjNPCbNaZhryUuV5qtJUR2EIK9r+NQ4UA5BtapsOTt57El8UYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e61LLEgY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D656C2BCB4;
	Tue, 31 Mar 2026 19:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774985955;
	bh=LdWC8xo+CPAGwLW7PW8lF3NLcrWHS3lZUnNpHwOj4pU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e61LLEgYBxiT+8+6g/PTHg9Bc8XOXR6pqG1GUT/A5LR2NndLBM2OXq9SwN2VZok3e
	 CWgwgqdiuvSwZ5hm8RYbH3Jh43DHkB/PVR08h7Tp8OJZdlMyswRCBPXZDIp0gMvMCo
	 qbqBXf2S6doOpGYgxcHO+nvNpByk6k1dc7JvW/CB0pYfFdYHquqX5BowSihZxLo3OV
	 B+/uqNBVm5Z2X/ufrNbx6yvznIlLTdiqeHxSDmTeTIqKdLZcumTxw5rukgrZSGiPmu
	 4UfF0uVXWl5okeeC4zDR4uY5Phq7YYevXz98R5hrNy02xMR+5Em2VkkSMAF+G8ht5G
	 WWMoQkxcOShEQ==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Linux ACPI <linux-acpi@vger.kernel.org>
Cc: linux-rtc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v1 2/4] ACPI: TAD: Relocate two functions
Date: Tue, 31 Mar 2026 21:25:40 +0200
Message-ID: <3960639.kQq0lBPeGt@rafael.j.wysocki>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6271-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,rafael.j.wysocki:mid]
X-Rspamd-Queue-Id: 1D6D7370A74
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Move two functions introduced previously, __acpi_tad_wake_set() and
__acpi_tad_wake_read(), to the part of the code preceding the sysfs
interface implementation, since subsequently they will be used by
the RTC device interface too.

No intentional functional impact.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/acpi_tad.c |   94 ++++++++++++++++++++++++------------------------
 1 file changed, 47 insertions(+), 47 deletions(-)

--- a/drivers/acpi/acpi_tad.c
+++ b/drivers/acpi/acpi_tad.c
@@ -174,6 +174,53 @@ static int acpi_tad_get_real_time(struct
 	return __acpi_tad_get_real_time(dev, rt);
 }
 
+static int __acpi_tad_wake_set(struct device *dev, char *method, u32 timer_id,
+			       u32 value)
+{
+	acpi_handle handle = ACPI_HANDLE(dev);
+	union acpi_object args[] = {
+		{ .type = ACPI_TYPE_INTEGER, },
+		{ .type = ACPI_TYPE_INTEGER, },
+	};
+	struct acpi_object_list arg_list = {
+		.pointer = args,
+		.count = ARRAY_SIZE(args),
+	};
+	unsigned long long retval;
+	acpi_status status;
+
+	args[0].integer.value = timer_id;
+	args[1].integer.value = value;
+
+	status = acpi_evaluate_integer(handle, method, &arg_list, &retval);
+	if (ACPI_FAILURE(status) || retval)
+		return -EIO;
+
+	return 0;
+}
+
+static int __acpi_tad_wake_read(struct device *dev, char *method, u32 timer_id,
+				unsigned long long *retval)
+{
+	acpi_handle handle = ACPI_HANDLE(dev);
+	union acpi_object args[] = {
+		{ .type = ACPI_TYPE_INTEGER, },
+	};
+	struct acpi_object_list arg_list = {
+		.pointer = args,
+		.count = ARRAY_SIZE(args),
+	};
+	acpi_status status;
+
+	args[0].integer.value = timer_id;
+
+	status = acpi_evaluate_integer(handle, method, &arg_list, retval);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+
 /* sysfs interface */
 
 static char *acpi_tad_rt_next_field(char *s, int *val)
@@ -273,31 +320,6 @@ static ssize_t time_show(struct device *
 
 static DEVICE_ATTR_RW(time);
 
-static int __acpi_tad_wake_set(struct device *dev, char *method, u32 timer_id,
-			       u32 value)
-{
-	acpi_handle handle = ACPI_HANDLE(dev);
-	union acpi_object args[] = {
-		{ .type = ACPI_TYPE_INTEGER, },
-		{ .type = ACPI_TYPE_INTEGER, },
-	};
-	struct acpi_object_list arg_list = {
-		.pointer = args,
-		.count = ARRAY_SIZE(args),
-	};
-	unsigned long long retval;
-	acpi_status status;
-
-	args[0].integer.value = timer_id;
-	args[1].integer.value = value;
-
-	status = acpi_evaluate_integer(handle, method, &arg_list, &retval);
-	if (ACPI_FAILURE(status) || retval)
-		return -EIO;
-
-	return 0;
-}
-
 static int acpi_tad_wake_set(struct device *dev, char *method, u32 timer_id,
 			     u32 value)
 {
@@ -328,28 +350,6 @@ static int acpi_tad_wake_write(struct de
 	return acpi_tad_wake_set(dev, method, timer_id, value);
 }
 
-static int __acpi_tad_wake_read(struct device *dev, char *method, u32 timer_id,
-				unsigned long long *retval)
-{
-	acpi_handle handle = ACPI_HANDLE(dev);
-	union acpi_object args[] = {
-		{ .type = ACPI_TYPE_INTEGER, },
-	};
-	struct acpi_object_list arg_list = {
-		.pointer = args,
-		.count = ARRAY_SIZE(args),
-	};
-	acpi_status status;
-
-	args[0].integer.value = timer_id;
-
-	status = acpi_evaluate_integer(handle, method, &arg_list, retval);
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
-	return 0;
-}
-
 static ssize_t acpi_tad_wake_read(struct device *dev, char *buf, char *method,
 				  u32 timer_id, const char *specval)
 {




