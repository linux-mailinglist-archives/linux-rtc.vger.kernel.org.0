Return-Path: <linux-rtc+bounces-3228-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E389A3C059
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 14:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FB643AAEC6
	for <lists+linux-rtc@lfdr.de>; Wed, 19 Feb 2025 13:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DBA21EB184;
	Wed, 19 Feb 2025 13:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ADRBu+Xs"
X-Original-To: linux-rtc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C689F1E3790;
	Wed, 19 Feb 2025 13:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739972596; cv=none; b=AvHWt2XOBT9kWZHvjmNLKikg/mozW4ogPhiTBXIZEBQTjFSq9ekaxMtX2LsHLLMDHXDvwMEGF8kxm4D4j/F0k6NXFSY4kqqmHTNaqTN+G3jDJ70CMPLnrZYthIJuE2MkM6qXpjW4grm3XxqckAoL/kmUkZdI3HD4fOaJFvv3fXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739972596; c=relaxed/simple;
	bh=8KfB7rbIPBnSY0LnsccyH07FlsHh2P9Fjsmpuh3Qk5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RZ2B6/C2yhK/m3XZsO52HyaOgk9H8JftbMCW2xT7R2Q/ya3Cd/12CDNnYZZFk43h8RIZ9c8b6ae6VCLS9xQ0m4RJp/St5kiLU35Mq/dHcU6boAPgE9BLuWRnc0/pDxTZOMp2JtzdKoo+E5I5tVse9jCsQJoJFcwcg7Kqh4I8s9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ADRBu+Xs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 976B5C4CED1;
	Wed, 19 Feb 2025 13:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739972596;
	bh=8KfB7rbIPBnSY0LnsccyH07FlsHh2P9Fjsmpuh3Qk5A=;
	h=From:To:Cc:Subject:Date:From;
	b=ADRBu+Xscq6HB/bnLjQc7B/pSVUMUly00qRmYbisVJDnrT7vj1/a5oO1dlq7275Cf
	 1oFUiixlAjAWRDqEG5JehFUxMMWmcmMEIXAFGznnE8t+AcpVGHB728D4eOMzsc8ZPI
	 zaGMU0U3k3e1MDwpANA9x4k3sWbXTbhP+yaNtEzO8OiXEMAmky52wuK83XvTL9odE2
	 4J02Sh/M9JdWG6dOdBfvcpr3VOhg1EyofJfmwy158dyTn9HWTHEW2WtbulwZdNJR1Y
	 F+c/ASYqLex8ag4K2HSyzfalnoGXW7QeEn+aW9ZbXjIO2r/4hEtM8xgTzqgxESPqrI
	 1G3Qg732CQscQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1tkkMH-0000000086W-0s5D;
	Wed, 19 Feb 2025 14:43:25 +0100
From: Johan Hovold <johan+linaro@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jonathan Marek <jonathan@marek.ca>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
	Joel Stanley <joel@jms.id.au>,
	Sebastian Reichel <sre@kernel.org>,
	Steev Klimaszewski <steev@kali.org>,
	linux-arm-msm@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 0/6] arm64: dts: qcom: x1e80100: enable rtc
Date: Wed, 19 Feb 2025 14:41:12 +0100
Message-ID: <20250219134118.31017-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.45.3
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for utilising the UEFI firmware RTC offset to
the Qualcomm PMIC RTC driver and uses that to enable the RTC on all X
Elite machines.

Included is also a patch to switch the Lenovo ThinkPad X13s over to
using the UEFI offset.

The RTCs in many Qualcomm devices are effectively broken due to the time
registers being read-only. Instead some other non-volatile memory can be
used to store an offset which a driver can take into account. On Windows
on Arm laptops, the UEFI firmware (and Windows) use a UEFI variable for
storing such an offset.

When RTC support for the X13s was added two years ago we did not yet
have UEFI variable support for these machines in mainline and there were
also some concerns regarding flash wear. [1] As not all Qualcomm
platforms have UEFI firmware anyway, we instead opted to use a PMIC
scratch register for storing the offset. [2]

On the UEFI machines in question this is however arguably not correct
as it means that the RTC time can differ between the UEFI firmware (and
Windows) and Linux.

Now that the (reverse engineered) UEFI variable implementation has been
merged and thoroughly tested, let's switch to using that to store the
RTC offset also on Linux. The flash wear concerns can be mitigated by
deferring writes due to clock drift until shutdown.

Note that this also avoids having to wait for months for Qualcomm to
provide a free PMIC SDAM scratch register for X1E and future platforms,
and specifically allows us to enable the RTC on X1E laptops today.

The first version of this series (and the RFC) used a DT property to
determine whether the UEFI firmware uses a variable for storing the RTC
offset. This is strictly only needed if we ever are to allow (further)
modular efivars implementations as otherwise a driver can just check if
the variable is there during probe (and assume efivars are available at
module init time).

The Qualcomm efivars implementation (qcom_qseecom_uefisecapp) cannot be
built as a module currently to avoid similar problems with user space
expecting efivarfs to be available during early boot. As changing this
now would cause a regression, let's assume at least the Qualcomm
implementation will remain built-in indefinitely.

Hopefully this all goes away (for future platforms) once Qualcomm fix
their UEFI implementation so that the UEFI time (and variable) services
can be used directly.

Johan


Changes in v2
 - drop DT property in favour of probing for the UEFI variable (Rob)
 - rebase on 6.14-rc1; use bool constant for device_init_wakeup()
 - fix flash wear commit message (X13s typo, example)

Changes since UEFI offset RFC [1]:
 - clarify that UEFI variable format is not arbitrary (Alexandre)
 - add missing use_uefi kernel doc
 - use dev_dbg() instead of dev_err() (Alexandre)
 - rename epoch define RTC_TIMESTAMP_EPOCH_GPS (Alexandre)
 - mitigate flash wear by deferring writes due to clock drift until
   shutdown

Changes since Jonathan's X1E series v3 [3]:
 - tweak qcom,no-alarm binding update (and drop Krystzof's Reviewed-by tag)
 - drop no-alarm flag and restructure probe() to clear feature flag before
   registering RTC
 - use UEFI variable offset on X1E

[1] https://lore.kernel.org/lkml/20230126142057.25715-1-johan+linaro@kernel.org/
[2] https://lore.kernel.org/lkml/20230202155448.6715-1-johan+linaro@kernel.org/
[3] https://lore.kernel.org/lkml/20241015004945.3676-1-jonathan@marek.ca/


Johan Hovold (4):
  rtc: pm8xxx: add support for uefi offset
  rtc: pm8xxx: mitigate flash wear
  arm64: dts: qcom: sc8280xp-x13s: switch to uefi rtc offset
  arm64: dts: qcom: x1e80100: enable rtc

Jonathan Marek (2):
  dt-bindings: rtc: qcom-pm8xxx: document qcom,no-alarm flag
  rtc: pm8xxx: implement qcom,no-alarm flag for non-HLOS owned alarm

 .../bindings/rtc/qcom-pm8xxx-rtc.yaml         |   5 +
 .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    |  11 -
 arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi  |   3 +-
 drivers/rtc/rtc-pm8xxx.c                      | 225 ++++++++++++++----
 include/linux/rtc.h                           |   1 +
 5 files changed, 189 insertions(+), 56 deletions(-)

-- 
2.45.3


