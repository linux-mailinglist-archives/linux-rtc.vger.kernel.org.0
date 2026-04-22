Return-Path: <linux-rtc+bounces-6395-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF4QHVLq6Gl4RgIAu9opvQ
	(envelope-from <linux-rtc+bounces-6395-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Apr 2026 17:33:38 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F3CBB447F59
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Apr 2026 17:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E020430CA647
	for <lists+linux-rtc@lfdr.de>; Wed, 22 Apr 2026 15:28:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89C53352FA5;
	Wed, 22 Apr 2026 15:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVgeXLni"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F253148CF;
	Wed, 22 Apr 2026 15:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776871688; cv=none; b=YtmAfc+0c2jmMBAtaF1WICADoEJNJWxd2ekOF3gXwZy4q3hvYBcuG3YqD1zyMgI8a2rCDE3VSOMYkXDGL2i3jnadSxIxn+ALoo0SoDbMqb1wyfZssKbwfESPdT34iOelOm4duGqpZ6qMWRNCx+t+QC7rGqPG60fDy4L8i1/jwe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776871688; c=relaxed/simple;
	bh=ZDh+qu/jJuEp3a8E/c1juqQKSRQJCYuNjwSq+08u4LM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qDr+/nFiUH5Mi8/iYei2eBHnTBGqfDOy5cuN4xzq7DocJ/vhjqivgGcyOxLMJl6sXpq/ugpp5X+dv1VPRf8oLz2+SV5+m2je3OAYpsf/mr1UKGkRd7tvp/2+k2aKHE5A7Rdm5PMDj9u/B7PLojpOQda4/q4flke11pfuvGtDW6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVgeXLni; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCCF6C2BCAF;
	Wed, 22 Apr 2026 15:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776871687;
	bh=ZDh+qu/jJuEp3a8E/c1juqQKSRQJCYuNjwSq+08u4LM=;
	h=From:To:Cc:Subject:Date:From;
	b=IVgeXLniIE7mj+XWv++dB5V9bkQGY+Pg+KZG+JVu+6X90oC4AlTmD3ZyjTF+3EXpd
	 3Q9TNY8ITzQpkLRdWh5cAV1juuo9xDDaT6unLZzDiwnu5cjpt+Kll83lKRgAkyNXE9
	 gE9B1XwDgu3oupFG20/HHtLcYhS++dGnWLXoAn27jG/DPAwVtMyNuZCHsF8S51tkCx
	 qXZIKO5Ofpd+i3BCWNQEhmFvU8aur4cDCu1ywtz3upzMpnq4tuyihnY6tVdKIaFgDZ
	 Gqk8gjRYb+MzPuo49PWNFp0AoDakHhRC+IVBA6csx6ppulyrFy6sV27r9ULOh+QeKd
	 e2LWPIP1iJ8bA==
From: "Rafael J. Wysocki" <rafael@kernel.org>
To: Linux ACPI <linux-acpi@vger.kernel.org>
Cc: linux-rtc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v1 0/4] ACPI: TAD: Fixes and cleanups on top of recent changes
Date: Wed, 22 Apr 2026 17:23:03 +0200
Message-ID: <2415066.ElGaqSPkdT@rafael.j.wysocki>
Organization: Linux Kernel Development
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-6395-lists,linux-rtc=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rafael.j.wysocki:mid]
X-Rspamd-Queue-Id: F3CBB447F59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi All,

This series fixes a couple of issues and makes a couple of cleanup
changes in the ACPI Time and Alarm Device (TAD) driver on top of
some updates of that driver that have been merged recently.

Patch [1/4] updates the driver to use the __ATTRIBUTE_GROUPS() macro
to simplify the code.

Patch [2/4] fixes the driver removal ordering that needs to take
the RTC class device interface into account now.

Patch [3/4] makes the RTC class device interface use rtc_tm_to_time64()
and rtc_time64_to_tm() in the alarm-related code that has a second
resolution anyway, which prevents ktime_t overflow from occurring when
attempting to convert large RTC time values to it.

Patch [4/4] updates a comment with incorrect English grammar.

All of the patches in this series are regarded as 7.1 material.

Thanks!




