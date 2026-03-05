Return-Path: <linux-rtc+bounces-6119-lists+linux-rtc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-rtc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Bb7MWZMqWk14AAAu9opvQ
	(envelope-from <linux-rtc+bounces-6119-lists+linux-rtc=lfdr.de@vger.kernel.org>)
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Mar 2026 10:27:02 +0100
X-Original-To: lists+linux-rtc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A91D20E5FA
	for <lists+linux-rtc@lfdr.de>; Thu, 05 Mar 2026 10:27:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB30C305F49F
	for <lists+linux-rtc@lfdr.de>; Thu,  5 Mar 2026 09:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5690D3783C0;
	Thu,  5 Mar 2026 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=spacecubics-com.20230601.gappssmtp.com header.i=@spacecubics-com.20230601.gappssmtp.com header.b="JXmoJNqu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6405C378813
	for <linux-rtc@vger.kernel.org>; Thu,  5 Mar 2026 09:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772702687; cv=pass; b=uJzDKWVzLidvvjORExteG7FDvfZZTQVN4KfdPTnNIQpLR5zfTsrSwCiryQ9MjCVTuKTOgMHZX9ziDZLrhbILAyVTU8Dgnt+xo59H7+jfAndoYqLUGYRslHXY3C/rr/xpnFfbFE4ADf53iMddqJv/eBseV7Eyouyg07E2qOs7ROc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772702687; c=relaxed/simple;
	bh=RyI/EasxGbNY8MAYGDpDHtAitKfMIIv+EOIA1+5tskY=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ANFBwjBoPA0zaW6nB2Gyus1tHlIyoQa0Grjqp9UDPxPKfNHwfhoNiusSrOhZ4igz4ZvJME2iUFNDdNvNXMrlKudnGwxcTOuiS0TgJmxL42Jvl2e0GTC+jtKa1rpoul1sVoyXBJQ+0mMIURcGkz4DLc0QqfBM2dJnt2VIldj+fBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=spacecubics.com; spf=none smtp.mailfrom=spacecubics.com; dkim=pass (2048-bit key) header.d=spacecubics-com.20230601.gappssmtp.com header.i=@spacecubics-com.20230601.gappssmtp.com header.b=JXmoJNqu; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=spacecubics.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=spacecubics.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-66174cf4549so108130a12.0
        for <linux-rtc@vger.kernel.org>; Thu, 05 Mar 2026 01:24:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772702683; cv=none;
        d=google.com; s=arc-20240605;
        b=Cqpv0/O/OgZdlrRQPj7e+TjBOvZGBI/0+v01wM/2cHEDTm1GNSbGR4Qf0ewUnpA38c
         EZ3qILXKzvMeJEtTD58NOl5Jo11XFekpqlLSLj41WhXDiq9ktald5UpI4GEQo/LrtNG6
         WnUcbwiCiltihr9+ZoQyqy6b1qRq+/XIE4iVca/G3oNwf8VJob4z5/wjuezYNEzkfp46
         abrWJNEF3xyWfDEjNl0puvS7YyA91wGUfhzMYTxI2rZnHsYNpoCf45bo/aEagXPiI+a4
         4r8EpsICnItd0kJffeERV97T5Aujk8DNMRjHEcBSPw54A12Zo16vl/uc+1JPtlZEysEb
         d7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ypYVyS5MeqKOLQueJPbQc6nHN3pg7qQVDG5ppaHItHg=;
        fh=H753Ybiq3wqcoULCcCfrnDT0TaOVOcXrhBeVr7RnQ7Q=;
        b=HQBYt6JtHj0yr2xnGYJxFiA3WREqUQRMxkimPVrA/dZRYtb5M+BEqHsUX10ZOcccx4
         AP8DF/MR3jS1AmRotQ7XCclDWQdwhKsQ6FfpzznD/QPTDcJp+O7sWak1TxEpz3ZBfFmJ
         qFv/+yDmaBrI1Hdnw97TIu+dMnmHehjC8H878Htao/6C+M1te/36k8t7t1w7pcCtKLk7
         vlVd5apwDfFGfkFVDHID1wWx6ZrNi1l0TG7CBSQtg4XJ0HVJ7VI/B4fnJaoyF21RQ+52
         EnKiOz01eacpxn+wum42pN5A+wIGtFQX0ET/J8cyYeIaq/+fY2GbP0qX07uje2qmJ2Q8
         O5kQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=spacecubics-com.20230601.gappssmtp.com; s=20230601; t=1772702683; x=1773307483; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ypYVyS5MeqKOLQueJPbQc6nHN3pg7qQVDG5ppaHItHg=;
        b=JXmoJNqudb+tGikNrkIaAPy1m6gZtNJLFgKe0oDZY4qHVu2cMkrwMFlKXFhVg3EKC+
         wHoJUMWmndIeyOEzaX4UXBJ9u+w5Gti7Kgdz/0+X+l7tZQHQKWBuSuwIoRbb8WHxIjVj
         GakoMlpCo5h+wzJWEVEuvPOWwAIh9D25gLGt8/oYFnRAyzr4e5ecuVYjdO8hrIKSW2y7
         TkynXcEylnrmHG9anWlZWHUg5Wfs4YxbD6dCwz/0wI4zP/e0L5cnO6tfYHrJRq6AlKp7
         rqvDVQWMejP6EKK/4mc053Dl0/xZy1yXQCcvz7zQK4oK0g14HO+aZSkkGlqK+DG7RR/1
         x8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772702683; x=1773307483;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ypYVyS5MeqKOLQueJPbQc6nHN3pg7qQVDG5ppaHItHg=;
        b=fRv3qtMd2ac2C1WOM669hEO7xkUerIwpI8kOWsEe67IwsT0x82guwIgP+oEbVmrjRP
         uWp5vRETBWhb5Nap1YyKziYCsPnSFvUY+2ZmRnXH67JfGOLoA/1Hpfr2MZ16rGdiWuhw
         msmStE2dTCg+r39fcPuXGy2Nzp0YBYOpyAna9ah6Uc9mlQDLA5R5KJsEzsR6at21uCeN
         uGZ8uGyX5eFpI6hnW+ft8rxNX9HFE5DK3mRUjsfSd0uDk8A+1QQxemW+XaugldckxHeD
         7z9lZl2jVP1c8HhEPNaZP5eNtio2IhA7mzHDQbWB3QOkTInrTy5WbCI7AXtRrhbIG+d5
         KfmA==
X-Gm-Message-State: AOJu0Yxp4H307mxpLbUt7jNJkGYf1iowqm8sh4TDoWmT9YlQxWbvTMi5
	lIB/GTYcksa/vqZfhrJJx7ukASNOVfQbG6d6nDSgaM5chjN0ywRSXwCniLI2DGp0JmUly3uXuvw
	9FzP+7W47oSK9nYruOoDTOgw3UqFWbgS72/GzXaO+GZEKA04nuOAtHHc=
X-Gm-Gg: ATEYQzx32CK64c9SLDjE9A+XZN6l+sYEpFo2F2V7z0lAlBd8bUem1euigjDhWaxEjBY
	AOiPGEJc5wX+kr28nSDyD6+RbmyfSC0/sgoJI0/bK9TLqCdCCzMGH3dt69ecJ56IgJXZYIlm9rs
	9okV2cwEE/iu+80a9ZoQLhBhSsz69Er222HOqXTVatuHbwe8XuTPTpEvn/Uf5wVW6JkAIDM/0SS
	pT0iuZQljf4CjqwNjD8yOC+HVYI0gcr66XsyJJTgQJXCm1POAKzEYm+sGBOCoY1O6aHg+I32SAg
	3aTfd2BD
X-Received: by 2002:aa7:d350:0:b0:659:9068:9786 with SMTP id
 4fb4d7f45d1cf-66143049299mr643291a12.10.1772702683052; Thu, 05 Mar 2026
 01:24:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Takumi Ando <takumi@spacecubics.com>
Date: Thu, 5 Mar 2026 18:24:32 +0900
X-Gm-Features: AaiRm51SsH53awVRF2arWNb7hgwkmuorUZUNyye2wdKdzYCE7letyAqnnB-XCdc
Message-ID: <CAJACUaoFK-GiBN_hfkNajDUygnSZc29U_jdeQ_rKtXS7P1f-nw@mail.gmail.com>
Subject: [QUESTION] rtc: zynqmp: CALIB_RD reset behavior differs between
 ZynqMP and Versal
To: linux-rtc@vger.kernel.org
Cc: alexandre.belloni@bootlin.com, michal.simek@amd.com, 
	Yasushi SHOJI <yashi@spacecubics.com>, kanta tamura <kanta@spacecubics.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 3A91D20E5FA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	R_DKIM_ALLOW(-0.20)[spacecubics-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[spacecubics.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-6119-lists,linux-rtc=lfdr.de];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[takumi@spacecubics.com,linux-rtc@vger.kernel.org];
	DKIM_TRACE(0.00)[spacecubics-com.20230601.gappssmtp.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-rtc];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,mail.gmail.com:mid,amd.com:url,spacecubics-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Action: no action

Hi,

I have a question about the initialization logic in the zynqmp RTC
driver(drivers/rtc/rtc-zynqmp.c).

Currently the driver programs CALIB_WRITE only when CALIB_READ returns 0:

ret = readl(... + RTC_CALIB_RD);
if (!ret)
    writel(freq, ... + RTC_CALIB_WR);

My understanding is that this was designed to avoid overwriting an
existing calibration value. Since the RTC may continue running from the
battery domain even when Linux is not running, the calibration value may
have been configured previously and should be preserved.

However, according to the Versal Adaptive SoC Register Reference (AM012) [1],
the value returned by CALIB_RD after reset can be undefined.
In practice, on Versal hardware we observe non-zero values even before
any calibration has been programmed. Because of this, the current logic
may skip programming CALIB_WR and leave the Max_Tick field uninitialized.

On Zynq UltraScale+ Devices Register Reference (UG1087) [2],
CALIB_RD resets to 0, so the current logic works correctly there.
However, this assumption does not appear to hold for Versal.

If there is a register or mechanism that indicates whether the RTC has
already been calibrated, the driver could use that instead. However,
I could not find such an indicator in the documentation.

Am I missing something here? Is there a recommended way to detect whether
RTC calibration has already been configured?

Alternatively, would it be acceptable for the driver to always program
Max_Tick while preserving the fractional calibration bits already stored
in hardware?

Best regards,

[1] https://docs.amd.com/r/en-US/am012-versal-register-reference/CALIB_READ-PMC_RTC-Register
[2] https://docs.amd.com/r/en-US/ug1087-zynq-ultrascale-registers/CALIB_READ-RTC-Register

-- 
Takumi Ando
Space Cubics Inc.

