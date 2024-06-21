Return-Path: <linux-rtc+bounces-1382-lists+linux-rtc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F3228912735
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 16:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C0871F286CD
	for <lists+linux-rtc@lfdr.de>; Fri, 21 Jun 2024 14:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF4FB125C1;
	Fri, 21 Jun 2024 14:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DhMaNpbu"
X-Original-To: linux-rtc@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE7955769;
	Fri, 21 Jun 2024 14:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718978533; cv=none; b=PIVmnt0fYwAIw+1arJKFG60cYLFtqwxKvL4qj+L/1z7d6vN6zrEnpUCW27o+F5lV5IBpLv5vjglLGz00/oII9YFXKmr1/nQuOeIsCkHZdZ9WPg1BCzyOzEo0cJ/mTQ9tBgS4JyOOGsqOx8vJ3/E1u1MJrRacyAIn1HapVpgzFjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718978533; c=relaxed/simple;
	bh=xSSGo27fvpVUQZd6TXXNi6BiUzNCmLmjNfLaF+T2WEU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aKW9g7TWDvb2e+5sc2S2+GjtvjCjfNYf1ZPG27aeH/21LqT/HfwTwQA7awQ4YMlPgSGZYn41FjWhBkihoshW+G4vogFyKIHkiQ5m7LCvItvN+2zwUlFBAd3BsttvUzBZP6krdJjWCahhUGEtaAhWuwUAEuxSjhOtRPaw1scsbhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=casper.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DhMaNpbu; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=casper.srs.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QGwpAthtGFLljvINfPkZWerIXgUjeM8V33v42QEVbOs=; b=DhMaNpbuLWxo2kEsDD68UAfxNd
	/UpU4Nq6iCI6XOFucGaBr4s8ef3tSt85/bRx5C2TN4XC+O7BdRGtksNDO5kd75iAoP10R736sE932
	sbQ+7RJKTlzJ0y3srKl0eFRgpM53k+eYN6C1FzyfZt0ov5kXNuUrAJO/nbivjRaKshA8EpNxMhgu0
	m4nE964ZSjlkkWjQBtfzut3rNZWI0AudVrviXevMer9pN6dMsKCyaGywEtCufqL0NUXhCSu1UQqOB
	NZ+NbbRkY6v/AlKriBieZ3gxtyHK8saFASqF/YiXy75xVHfB1ORKa37m67RgLq9luwJ5Nb/3WjqdT
	wsJxgp8A==;
Received: from [2001:8b0:10b:5:79ed:809d:f17f:46e5] (helo=u3832b3a9db3152.ant.amazon.com)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKeq2-00000007GIn-24TE;
	Fri, 21 Jun 2024 14:02:02 +0000
Message-ID: <9f2d0a1ca9997cad98b45f6e36dbef929a9aa186.camel@infradead.org>
Subject: Re: [RFC PATCH v3 0/7] Add virtio_rtc module and related changes
From: David Woodhouse <dwmw2@infradead.org>
To: Peter Hilber <peter.hilber@opensynergy.com>,
 linux-kernel@vger.kernel.org,  virtualization@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,  linux-rtc@vger.kernel.org, "Ridoux,
 Julien" <ridouxj@amazon.com>,  virtio-dev@lists.linux.dev
Cc: "Christopher S. Hall" <christopher.s.hall@intel.com>, Jason Wang
 <jasowang@redhat.com>, John Stultz <jstultz@google.com>, "Michael S.
 Tsirkin" <mst@redhat.com>, netdev@vger.kernel.org, Richard Cochran
 <richardcochran@gmail.com>, Stephen Boyd <sboyd@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Marc
 Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>, Alessandro Zummo
 <a.zummo@towertech.it>,  Alexandre Belloni <alexandre.belloni@bootlin.com>
Date: Fri, 21 Jun 2024 15:02:01 +0100
In-Reply-To: <671a784b-234f-4be6-80bf-5135e257ed40@opensynergy.com>
References: <20231218073849.35294-1-peter.hilber@opensynergy.com>
	 <684eac07834699889fdb67be4cee09319c994a42.camel@infradead.org>
	 <671a784b-234f-4be6-80bf-5135e257ed40@opensynergy.com>
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-534Kw2nvt6LhAkQL8Yp3"
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-rtc@vger.kernel.org
List-Id: <linux-rtc.vger.kernel.org>
List-Subscribe: <mailto:linux-rtc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-rtc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-534Kw2nvt6LhAkQL8Yp3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2024-06-20 at 14:37 +0200, Peter Hilber wrote:
> Should implement .gettimex64 instead.

Thanks. This look sane?

As noted in the code comment, in the *ideal* case we just build all
three pre/post/device timestamps from the very same counter read. So
sts->pre_ts =3D=3D sts->post_ts.

In the less ideal case (which will happen on x86 when kvmclock is being
used for the system time), we use the time from ktime_get_snapshot() as
the pre_ts and take a new snapshot immediately after the get_cycles().


diff --git a/drivers/ptp/ptp_vmclock.c b/drivers/ptp/ptp_vmclock.c
index e8c65405a8f3..07a81a94d29a 100644
--- a/drivers/ptp/ptp_vmclock.c
+++ b/drivers/ptp/ptp_vmclock.c
@@ -96,9 +96,11 @@ static inline uint64_t mul_u64_u64_add_u64(uint64_t *res=
_hi, uint64_t delta,
 }
=20
 static int vmclock_get_crosststamp(struct vmclock_state *st,
+				   struct ptp_system_timestamp *sts,
 				   struct system_counterval_t *system_counter,
 				   struct timespec64 *tspec)
 {
+	struct system_time_snapshot systime_snapshot;
 	uint64_t cycle, delta, seq, frac_sec;
 	int ret =3D 0;
=20
@@ -119,7 +121,17 @@ static int vmclock_get_crosststamp(struct vmclock_stat=
e *st,
 			continue;
 		}
=20
-		cycle =3D get_cycles();
+		if (sts) {
+			ktime_get_snapshot(&systime_snapshot);
+
+			if (systime_snapshot.cs_id =3D=3D st->cs_id) {
+				cycle =3D systime_snapshot.cycles;
+			} else {
+				cycle =3D get_cycles();
+				ptp_read_system_postts(sts);
+			}
+		} else
+			cycle =3D get_cycles();
=20
 		delta =3D cycle - st->clk->counter_value;
=20
@@ -139,6 +151,21 @@ static int vmclock_get_crosststamp(struct vmclock_stat=
e *st,
 	if (ret)
 		return ret;
=20
+	/*
+	 * When invoked for gettimex64, fill in the pre/post system times.
+	 * The ideal case is when system time is based on the the same
+	 * counter as st->cs_id, in which case all three pre/post/device
+	 * times are derived from the *same* counter value. If cs_id does
+	 * not match, then the value from ktime_get_snapshot() is used as
+	 * pre_ts, and ptp_read_system_postts() was already called above
+	 * for the post_ts. Those are either side of the get_cycles() call.
+	 */
+	if (sts) {
+		sts->pre_ts =3D ktime_to_timespec64(systime_snapshot.real);
+		if (systime_snapshot.cs_id =3D=3D st->cs_id)
+			sts->post_ts =3D sts->pre_ts;
+	}
+
 	if (system_counter) {
 		system_counter->cycles =3D cycle;
 		system_counter->cs_id =3D st->cs_id;
@@ -155,7 +182,7 @@ static int ptp_vmclock_get_time_fn(ktime_t *device_time=
,
 	struct timespec64 tspec;
 	int ret;
=20
-	ret =3D vmclock_get_crosststamp(st, system_counter, &tspec);
+	ret =3D vmclock_get_crosststamp(st, NULL, system_counter, &tspec);
 	if (!ret)
 		*device_time =3D timespec64_to_ktime(tspec);
=20
@@ -198,7 +225,16 @@ static int ptp_vmclock_gettime(struct ptp_clock_info *=
ptp, struct timespec64 *ts
 	struct vmclock_state *st =3D container_of(ptp, struct vmclock_state,
 						ptp_clock_info);
=20
-	return vmclock_get_crosststamp(st, NULL, ts);
+	return vmclock_get_crosststamp(st, NULL, NULL, ts);
+}
+
+static int ptp_vmclock_gettimex(struct ptp_clock_info *ptp, struct timespe=
c64 *ts,
+				struct ptp_system_timestamp *sts)
+{
+	struct vmclock_state *st =3D container_of(ptp, struct vmclock_state,
+						ptp_clock_info);
+
+	return vmclock_get_crosststamp(st, sts, NULL, ts);
 }
=20
 static int ptp_vmclock_enable(struct ptp_clock_info *ptp,
@@ -216,6 +252,7 @@ static const struct ptp_clock_info ptp_vmclock_info =3D=
 {
 	.adjfine	=3D ptp_vmclock_adjfine,
 	.adjtime	=3D ptp_vmclock_adjtime,
 	.gettime64	=3D ptp_vmclock_gettime,
+	.gettimex64	=3D ptp_vmclock_gettimex,
 	.settime64	=3D ptp_vmclock_settime,
 	.enable		=3D ptp_vmclock_enable,
 	.getcrosststamp =3D ptp_vmclock_getcrosststamp,



--=-534Kw2nvt6LhAkQL8Yp3
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjQwNjIxMTQwMjAxWjAvBgkqhkiG9w0BCQQxIgQg7YxV0eMW
25bwLv8PUXnVIENdg6iIwfEfj/4ehzJfbAswgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgCm0tyPmiNAMqQgLW0LHFBRZj+oRctnV5OX
JzaxaAcyY2+lJH3iG5oqT8WmDFeF2p5EjVlFUf7Lalqc0YPlMnE1HsGX8pFxHSDDtdKkPWp7JXzg
vg3W2VA64HrkSLkkLEk1JSHXAFmmfsAslxZ/wcDkB+8DH2KDoqW05z/d8kTN6UQ/F2QlUlgqufP+
sMgHtSuKeUn9C6XJrTWDGNUENqcktK1mowbJmFpyjJhlOXxUNYl+FTrYvO9XHbToHAPNcIBIU2Cg
7tNBADsUDbBWmL0LoSfDeSJHpkPiLp6Gosa5vMtb16asAZwd4EMEABm+leIKpq1pHa7NMQltcqFV
WSbk3f7dIcont7Jy0+G1tffcCpfphGrR5VEq7jmievvkRnqtmtdgrYkI6phy9gFYIa9MQxURDtxD
tT1Zq8jWd6WZLt0P8EihVjj3e6ACqLE46qNCAvoE46FN++T0HxycnITh8DYLG7vwWQx/LCuZLWZE
g/1Sl160XHZi2XpYt6oQl4gSDxXGJcEauMxVK6kQuFWxAG1r0LTha2WlZV18bMqYMx42zcMREBZ3
/VoMu0Trbs26JfA2ZvD3btU7wTnMntPu7nqLRmVG3zlJiZioC0nHH8GbuUvdfiwmEPLDSY2fXb9A
yHtCWM9v/ZBBQFRz7DuJ6nQKxdr0cuIfpmwtEUwjKAAAAAAAAA==


--=-534Kw2nvt6LhAkQL8Yp3--

