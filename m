Return-Path: <linux-rtc+bounces-6633-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dyx7Ck0zJWoBEgIAu9opvQ
	(envelope-from <linux-rtc+bounces-6633-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Sun, 07 Jun 2026 11:01:01 +0200
X-Original-To: lists+linux-rtc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 797AF64F30F
	for <lists+linux-rtc@lfdr.de>; Sun, 07 Jun 2026 11:01:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=yoseli.org header.s=gm1 header.b=ifxKt4OF;
	spf=pass (mail.lfdr.de: domain of "linux-rtc+bounces-6633-lists+linux-rtc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-rtc+bounces-6633-lists+linux-rtc=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=yoseli.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 264F8300C010
	for <lists+linux-rtc@lfdr.de>; Sun,  7 Jun 2026 09:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00ACA37BE96;
	Sun,  7 Jun 2026 09:00:59 +0000 (UTC)
X-Original-To: linux-rtc@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E6737BE93;
	Sun,  7 Jun 2026 09:00:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780822858; cv=none; b=IUlGDNAGYqmgjTtwyv5GhGs5JVX/k/Er0kVYb4fWOhgaL/CWxsTVUdWiWhqxEGwpqJR4V31meEtCEPP1Dgz/XayYjTSr6HFjpl87L8lRx0K//1K3nyntnhExaoCtA6flS/5cA9IDwQYDtl926K0pNRQ48Hjeyjsht7b6mfwgWIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780822858; c=relaxed/simple;
	bh=lZlmYjhH5lcKC+wcaIyZsZolPJosiL9oQdkaC2Tj37c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eX79Q+YVylfmGgKDwor3WMw02O5JrasA47y8+tgRHP9OAKiqtSchh7G8I1vjxbNmhzJp4FTkl/ustfaPgfLunlOhX7P9NNOyrwcSE5ct8MRoH/ufeZNAHN6JHrBA4uWIgpU8lmUofv8Ut8B/ios6hFQQug7tMW6f+OuNkpxeZhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yoseli.org; spf=pass smtp.mailfrom=yoseli.org; dkim=pass (2048-bit key) header.d=yoseli.org header.i=@yoseli.org header.b=ifxKt4OF; arc=none smtp.client-ip=217.70.183.198
Received: by mail.gandi.net (Postfix) with ESMTPSA id 973393EBBC;
	Sun,  7 Jun 2026 09:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1780822849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6xcpIg2hT8E09rThYFsm1gWVtrpT8JJHtcR5VBXH8zc=;
	b=ifxKt4OFaUa9aQeMVpUGx5hr47FIj6a/qiJnB7uTWrNCpm3O7U1fde9UDyLzEeBN6vRGpT
	jQGKSL5tZSSiQHQ4xtezTAHq7S4M9RfmQlXi5G0I0f858xpecYYK2vduzYQFn0fcCyCpZ3
	nG1wxlD+wFQ4RBBNc4bXvOzR7GZXp52Ao6Hk4DqRfRZF6wNJzyUc1g+V7lj1fOj9pO97NP
	x9S+QvvY0shkfCHR02mYs7PhdImJDQJDryuJzXrLFxvBNlM0dmPhpCSrM7iFBTexB1b4gh
	03nRm5KjPoaX3dk8rkJCWw9zk/vgJGpjQpmjFUx132L4Hsm1FSjlyWMuSQL4tQ==
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
Subject: [PATCH v2 0/2] rtc: add a driver for the Freescale MCF5441x
 on-chip RTC
Date: Sun, 07 Jun 2026 11:00:39 +0200
Message-Id: <20260607-jmh-upstream-coldfire-rtc-v2-0-948d2b1ed146@yoseli.org>
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADczJWoC/32NywqDMBBFf0Wybkoy4Kur/kdxoXGiI2pkEqUi/
 nt97Ls8cO85m/DIhF68ok0wLuTJjQfAIxKmLccGJdUHC1CQqBhy2Q2tnCcfGMtBGtfXlhglByO
 zrFJ5XIGxkInjPzFa+l7uT3Gzn6sOTTiF56IlHxyvV3zR5+7uJAr+dBYtldSoIS91mtZg36vz2
 NPTcSOKfd9/PoTQuNUAAAA=
X-Change-ID: 20260529-jmh-upstream-coldfire-rtc-88b095b2cf28
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Greg Ungerer <gerg@linux-m68k.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, 
 linux-m68k@lists.linux-m68k.org, 
 Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780822848; l=2399;
 i=jeanmichel.hautbois@yoseli.org; s=20240925; h=from:subject:message-id;
 bh=lZlmYjhH5lcKC+wcaIyZsZolPJosiL9oQdkaC2Tj37c=;
 b=nXPoCiWDDm+KVdnPhuc67qCNDATPekHijnSK8i7CON6IUY5iv3zUytimNwtGSWI166XY6/1Nb
 080KsUvQLQICcHUmw8AQlY1o54Nd2NMPMlHCXpSeRizTNycYpB06GfS
X-Developer-Key: i=jeanmichel.hautbois@yoseli.org; a=ed25519;
 pk=MsMTVmoV69wLIlSkHlFoACIMVNQFyvJzvsJSQsn/kq4=
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: dmFkZTFDk84YLy1veZXYw5Wq2Rsrn4DWp01f6DDUbIlK8WrRsH+Zr5YRmoRn6Ob+XIPpijCvRE2GRDUgU+6IG4FnmtRoj0x6QuP7W6KVYQovCadkZIP+dI/+IMUFVOR3OgZEdtYpwP7GCvvBggBevFALHZrTabA2Zvz2XhLnXbUxUquGWDUpYIhuVj4Ki13LksxmBRv7/i44Z1JmbLAOBCVbm6g4AtR8D6xf5uqZkKrAPR605UmeusD1MNgiT+NXTfkSKq0zDyWB1dVTvqcB39DP9o+y1fYgQvQ80XnnOM9Vy1QJzt0hASTA8Saa6lrihM6RuIcRjY/VBckZ93G0xdXqFFjHf3xxM1W30ru0gSc6W4K4DdWPo1N25kUkuEE2SQS0JN2aLlKHEq9rYpEuPJ/w+sDTk8W0sUsFNvAOa3xdbBGXFuCP1ARyHSrB2h/pw0Z7YjWhAo/ucLQ9PbViKOdJAV5gTZDpgfpyLv/VPsPRARjhoWNXqxjtxxt1zl9fVfmmyLuDtaVPyx5V5iTT6oHtMfUGJ3YY1grjqL2EGCHd+VaVjA/8a48zrKvuH6AUwyK82muqKhiY1qzKl2Q4Yn2Wj0i7cgnZmoTHH+UM9iu9BO8dWyAtPE3ZAzaR+f5Q7Fr6rtgTuXDXWbfHAAlwFrs4nqTmuRUT0u90eyFHLhZ1M0xOeg
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[yoseli.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[yoseli.org:s=gm1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6633-lists,linux-rtc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:alexandre.belloni@bootlin.com,m:gerg@linux-m68k.org,m:geert@linux-m68k.org,m:linux-kernel@vger.kernel.org,m:linux-rtc@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:jeanmichel.hautbois@yoseli.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[yoseli.org:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jeanmichel.hautbois@yoseli.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeanmichel.hautbois@yoseli.org,linux-rtc@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-rtc];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 797AF64F30F

This series adds support for the "robust" real time clock found on the
Freescale MCF5441x family of ColdFire SoCs.

Patch 1 adds the rtc-class driver. Besides the usual time/calendar and a
one-shot alarm, the block contains 2KB of battery-backed standby RAM that
survives a main-power loss while VSTBY_RTC is supplied; the driver exposes
it through the nvmem framework so userspace can persist data (for example a
reset/reboot counter) across power cycles. Register and standby-RAM writes
go through the RTC_CR[WE] knock sequence, the time counters are read under
the RTC_SR[INVAL] guard described in the reference manual, and the time/date
encoding is forced to binary at probe.

Patch 2 registers the platform device from the m5441x ColdFire SoC support
code so that every MCF5441x board gets the RTC. The MCFRTC_BASE, MCFRTC_SIZE
and MCF_IRQ_RTC definitions it relies on already exist in
arch/m68k/include/asm/m5441xsim.h.

The driver has been exercised on an MCF54418-based board: it registers
as an rtc device, exposes the standby RAM as an nvmem device, and a value
written to the standby RAM survives a mains power-cycle.

Signed-off-by: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
---
Changes in v2:
- Patch 1: wait_valid() now uses read_poll_timeout_atomic() instead of an
  open-coded busy-wait. The atomic variant is required because it runs with
  p->lock held and interrupts off. (Geert Uytterhoeven)
- Patch 1: nvram_read()/nvram_write() use unsigned int rather than size_t
  for the chunk/index locals, and scoped_guard(spinlock_irqsave) instead of
  explicit spin_lock_irqsave()/spin_unlock_irqrestore(). (Geert Uytterhoeven)
- Link to v1: https://patch.msgid.link/20260602-jmh-upstream-coldfire-rtc-v1-0-1e129a177d2f@yoseli.org

---
Jean-Michel Hautbois (2):
      rtc: m5441x: add MCF5441x on-chip RTC driver
      m68k: coldfire/m5441x: register the on-chip RTC

 MAINTAINERS                 |   6 +
 arch/m68k/coldfire/m5441x.c |  29 +++
 drivers/rtc/Kconfig         |  12 +
 drivers/rtc/Makefile        |   1 +
 drivers/rtc/rtc-m5441x.c    | 579 ++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 627 insertions(+)
---
base-commit: 979c294509f9248fe1e7c358d582fb37dd5ca12d
change-id: 20260529-jmh-upstream-coldfire-rtc-88b095b2cf28

Best regards,
--  
Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>


